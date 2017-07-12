class Api::V1::Vndb::NovelsController < ApplicationController
  before_action :require_moderator, only: :update
  before_action :require_admin, only: [:create, :destroy]

  ROLE = {
    0 => :protagonist,
    1 => :main,
    2 => :side
  }
  POSITIONS = {
    'Staff'    => :staffs,
    'Vocals'   => :vocals,
    'Composer' => :composers,
    'Artist'   => :artists,
    'Scenario' => :scenarios
  }

  def index
    @novels = ::Vndb::Novel.all

    paginate json: @novels, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Vndb::Novel::ListSerializer
  end

  def show
    if params[:full_info].present?
      @novel = ::Vndb::Novel
        .includes(
          :tags, :screenshots, :people,
          { characters: { people: :country } },
          { releases: [{ developers: :country }, { publishers: :country }] }
        )
        .find(params[:id])
      @novel.full_info = true

      @novel.characters_grouped = GroupSerializeService
        .new(@novel.characters, :role, ROLE, Api::V1::Vndb::Novel::CharacterSerializer)
        .perform
        .result

      @novel.staffs_grouped = GroupSerializeService
        .new(@novel.staffs, :position, POSITIONS, Api::V1::Vndb::Novel::StaffSerializer)
        .perform
        .result

      get_producers_svc = VndbService::Novel::GetProducers.new(@novel)
      @novel.producers = { publishers: [], developers: [] }
      @novel.producers[:publishers] = get_producers_svc.perform(:publishers, serialize: true).result
      @novel.producers[:developers] = get_producers_svc.perform(:developers, serialize: true).result
    else
      @novel = ::Vndb::Novel.find(params[:id])
    end

    render json: @novel, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Vndb::Novel::DetailSerializer
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
