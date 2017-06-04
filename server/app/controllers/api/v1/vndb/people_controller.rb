class Api::V1::Vndb::PeopleController < ApplicationController
  def show
    @person = ::Vndb::Person.find(params[:id])
    render json: @person, key_transform: :camel_lower
  end
end
