class Api::V1::Vndb::SearchController < ApplicationController
  def novels
    query = NetworkKanjiFilter.to_hiragana(params[:q])

    @novels = ::Vndb::Novel.search do
      keywords query, fields: [:title, :title_en], highlight: true
    end.results

    paginate json: @novels, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Vndb::Novel::ListSerializer
  end
end
