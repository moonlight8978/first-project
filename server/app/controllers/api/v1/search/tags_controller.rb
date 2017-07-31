class Api::V1::Search::TagsController < ApplicationController
  def index
    (render json: [], status: :ok and return) unless params[:q].present?
    query = NetworkKanjiFilter.to_hiragana(params[:q])

    @tags = ::Db::Novel::Tag.search do
      keywords query, fields: [:tag, :tag_en], highlight: true
    end.results

    paginate json: @tags, key_transform: :camel_lower, status: :ok,
      per_page: 20,
      page: params[:page],
      each_serializer: Api::V1::Db::Novel::Tag::TagListSerializer
  end
end
