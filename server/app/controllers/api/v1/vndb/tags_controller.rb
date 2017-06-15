class Api::V1::Vndb::TagsController < ApplicationController
  def index
    @novel = ::Vndb::Novel.find(params[:novel_id])
    @tags = @novel.tags

    render json: @tags, key_transform: :camel_lower, status: :ok,
        each_serializer: Api::V1::Vndb::Novel::TagSerializer
  end
end
