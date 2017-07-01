class Api::V1::Db::NovelsController < ApplicationController
  before_action :require_moderator, only: :update
  before_action :require_admin, only: [:create, :destroy]

  def index
    @novels = ::Db::Novel.all.page(params[:page]).per(params[:per_page])

    if params[:length].present?
      @novels = @novels.where(length: params[:length])
    end

    paginate json: @novels, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Db::Novel::NovelListSerializer
  end

  def show
    @get_novel_svc = NovelService::GetInfo.new(params[:id])
    if params[:full_info].present?
      @novel = @get_novel_svc.perform(full_info: true).result
    else
      @novel = @get_novel_svc.perform.result
    end

    render json: @novel, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Db::Novel::NovelDetailSerializer
  end

  def create
    create_novel_svc = NovelService::CreateNovel.new(create_novel_params)
    create_novel_svc.perform

    if create_novel_svc.error?
      head :conflict
    else
      render_ok(novel_id: create_novel_svc.novel.id)
    end
  end

  def update
    @novel = ::Db::Novel.find(params[:id])
    update_novel_svc = NovelService::UpdateNovel.new(@novel, update_novel_params)
    update_novel_svc.perform

    if update_novel_svc.error?
      head :conflict
    else
      render_ok
    end
  end

  def destroy
    @novel = ::Db::Novel.find(params[:id])
    destroy_novel_svc = NovelService::DestroyNovel.new(@novel)
    destroy_novel_svc.perform

    if destroy_novel_svc.error?
      head :conflict
    else
      render_ok
    end
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
