class Api::V1::Database::PeopleController < ApplicationController
  def index
    @people = ::Database::Person.all

    paginate json: @people, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Database::Person::PersonSerializer
  end

  def show
    @person = ::Database::Person.find(params[:id])

    render json: @person, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Database::Person::PersonSerializer
  end

  def create

  end

  def update

  end

  def destroy

  end
end
