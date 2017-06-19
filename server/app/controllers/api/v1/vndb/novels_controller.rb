class Api::V1::Vndb::NovelsController < ApplicationController
  before_action :require_moderator, only: :update
  before_action :require_admin, only: [:create, :destroy]
  after_action :before, only: :index_company
  def before
    puts "Params la: #{params.inspect}"
  end

  def index
    @novels = ::Vndb::Novel.all

    paginate json: @novels, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Vndb::Novel::NovelSerializer
  end

  def show
    @novel = ::Vndb::Novel.find(params[:id])
    render json: @novel, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Vndb::Novel::NovelSerializer
  end

  def create
    create_novel_svc = VndbService::Novel::CreateNovel.new(create_novel_params)
    create_novel_svc.perform

    if create_novel_svc.error?
      head :conflict
    else
      render_ok(novel_id: create_novel_svc.novel.id)
    end
  end

  def update
    @novel = ::Vndb::Novel.find(params[:id])
    update_novel_svc = VndbService::Novel::UpdateNovel.new(@novel, update_novel_params)
    update_novel_svc.perform

    if update_novel_svc.error?
      head :conflict
    else
      render_ok
    end
  end

  def destroy
    @novel = ::Vndb::Novel.find(params[:id])
    destroy_novel_svc = VndbService::Novel::DestroyNovel.new(@novel)
    destroy_novel_svc.perform

    if destroy_novel_svc.error?
      head :conflict
    else
      render_ok
    end
  end

  def index_company
    render_unauthorized and return unless params[:type].present?
    @company = ::Vndb::Company.find(params[:company_id])
    if params[:type] == 'publisheds'
      @novels = @company.publisheds
    elsif params[:type] == 'developeds'
      @novels = @company.developeds
    end

    paginate json: @novels, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Vndb::Company::ReleaseSerializer
  end

private
  def create_novel_params
    params.permit(
      :title, :title_en, :length, :description, :description_en,
      :image, :image_description, :image_nsfw,
      characters: [
        :name, :name_en, :birthday_day, :birthday_month, :gender,
        :weight, :height, :bust, :waist, :hip, :blood_type, :image, :role,
        :description, :description_en
      ]
    )
  end

  def update_novel_params
    params.permit(
      :title, :title_en, :length, :description, :description_en,
      :image, :image_description, :image_nsfw
    )
  end
end
