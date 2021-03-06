class Api::V1::Search::NovelsController < ApplicationController
  def index
    (render json: [], status: :ok and return) unless params[:q].present?
    query = NetworkKanjiFilter.to_hiragana(params[:q])

    @novels = ::Db::Novel.search do
      keywords query, fields: [:title, :title_en], highlight: true
    end.results

    paginate json: @novels, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      page: params[:page],
      each_serializer: Api::V1::Db::Novel::NovelListSerializer
  end
end
