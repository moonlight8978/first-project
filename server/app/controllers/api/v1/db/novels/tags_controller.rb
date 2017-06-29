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

  def create

  end

  def update

  end

  def destroy

  end

  def index_novel
    @tags = ::Db::Novel.find(params[:novel_id])
      .tags

    render json: @tags, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Db::Novel::TagSerializer
  end

  def create_novel

  end

  def destroy_novel

  end
end
