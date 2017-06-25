class Api::V1::Vndb::TagsController < ApplicationController
  def index
    @tags = ::Vndb::Tag.all

    paginate json: @tags, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Vndb::Novel::TagSerializer
  end

  def show
    @tag = ::Vndb::Tag.find(params[:id])

    render json: @tag, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Vndb::Novel::TagSerializer
  end

  def create

  end

  def update

  end

  def destroy

  end

  def index_novel
    @novel = ::Vndb::Novel.find(params[:novel_id])
    @tags = @novel.tags

    render json: @tags, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Vndb::Novel::TagSerializer
  end

  def create_novel

  end

  def destroy_novel

  end
end
