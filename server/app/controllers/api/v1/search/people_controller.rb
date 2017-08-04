class Api::V1::Search::PeopleController < ApplicationController
  def index
    (render json: [], status: :ok and return) unless params[:q].present?
    query = NetworkKanjiFilter.to_hiragana(params[:q])

    @people = ::Db::Person.search(include: :country) do
      keywords query, fields: [:name, :name_en, :twitter], highlight: true
    end.results

    paginate json: @people, key_transform: :camel_lower, status: :ok,
      per_page: 10,
      page: params[:page] || 1,
      each_serializer: Api::V1::Db::Person::PersonListSerializer
  end
end
