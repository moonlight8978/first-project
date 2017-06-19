class Api::V1::Vndb::PeopleController < ApplicationController
  def index
    @people = ::Vndb::Person.all

    paginate json: @people, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Vndb::Person::PersonSerializer
  end

  def show
    @person = ::Vndb::Person.find(params[:id])

    render json: @person, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Vndb::Person::PersonSerializer
  end

  def create

  end

  def update

  end

  def destroy

  end
end
