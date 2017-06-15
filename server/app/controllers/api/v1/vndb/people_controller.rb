class Api::V1::Vndb::PeopleController < ApplicationController
  def show
    @person = ::Vndb::Person.find(params[:id])
    render json: @person, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Vndb::Person::PersonSerializer
  end

  def voiceds
    @person = ::Vndb::Person
      .includes({ characters: { novel: :releases } }, :country)
      .find(params[:id])
    @voiceds = @person.voice_actresses
    render json: @voiceds, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Vndb::Person::VoicedSerializer
  end

  def credits
    @person = ::Vndb::Person.includes({ novels: :releases }, :country)
      .find(params[:id])
    @credits = @person.staffs
    render json: @credits, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Vndb::Person::CreditSerializer
  end
end
