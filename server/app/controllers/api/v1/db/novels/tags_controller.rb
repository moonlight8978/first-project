class Api::V1::Db::Novels::TagsController < ApplicationController
  def index
    @tags = ::Db::Novel::Tag.all

    paginate json: @tags, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Db::Novel::Tag::TagListSerializer
  end

  def show
    @tag = ::Db::Novel::Tag.find(params[:id])

    render json: @tag, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Db::Novel::Tag::TagDetailSerializer
  end

  def novels
    query_results = ::Db::Novel.search(include: [:ratings, :releases]) do
      with(:tag_ids, params[:novel_tag_id])
      order_by(:title_sort, :asc)
      paginate(page: params[:page] || 1, per_page: 6)
    end

    p query_results

    render json: query_results.results, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Db::Novel::NovelListSerializer

    response.headers['x-per-page'] = 6
    response.headers['x-page'] = params[:page] || 1
    response.headers['x-total'] = query_results.total
  end

  def create
    # Find tag, check if exists
    @tag = ::Db::Novel::Tag.create(create_tag_params)

    if @tag.errors.any?
      render json: @tag.errors, status: :bad_request
    else
      render_ok
    end
  end

  def update
    @tag = ::Db::Novel::Tag.find(params[:id])
    @tag.assign_attributes(update_tag_params)
    @errors = ErrorMessage.new
    if @tag.changed?
      @tag.save || @errors.add!(@tag.errors)
    else
      @errors.add!(message_from_server: 'Nothing changed!')
    end

    if @errors.any?
      render json: @errors.detail, status: :bad_request
    else
      render_ok
    end
  end

  def destroy
    @tag = ::Db::Novel::Tag.find(params[:id])

    begin
      @tag.destroy!
    rescue ActiveRecord::RecordNotDestroyed => e
      @errors = ErrorMessage.new(e.record.errors)
    end

    if @errors && @errors.any?
      render json: @errors.detail, status: :bad_request
    else
      render_ok
    end
  end

  def index_novel
    @tags = ::Db::Novel.find(params[:novel_id])
      .tags

    render json: @tags, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Db::Novel::TagSerializer
  end

  def create_novel
    @novel = ::Db::Novel.find(params[:novel_id])
    @tag = ::Db::Novel::Tag.find(params[:id])
    @errors = ErrorMessage.new

    unless @novel.tags.exists?(@tag.id)
      @novel.tags << @tag
      render_ok
    else
      @errors.add!(message_from_server: 'Tag is already exists in collection')
      @errors.set_status(:conflict)
      render json: @errors.detail, status: @errors.status
    end
  end

  def destroy_novel
    @novel = ::Db::Novel.find(params[:novel_id])
    @tag = ::Db::Novel::Tag.find(params[:id])

    if @tag.novels.exists?(@novel.id)
      @tag.novels.destroy(@novel)
      render_ok
    else
      render json: ErrorMessage.new(message_from_server: 'WTF are you trying to do'),
        status: :conflict
    end
  end

private

  def create_tag_params
    params.permit(:tag, :tag_en, :description, :description_en)
  end

  def update_tag_params
    params.permit(:tag, :tag_en, :description, :description_en)
  end
end
