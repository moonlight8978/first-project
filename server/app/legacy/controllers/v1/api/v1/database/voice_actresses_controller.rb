class Api::V1::Database::VoiceActressesController < ApplicationController
  def index_person
    @person = ::Database::Person
      .includes({ characters: { novels: :releases } }, :country)
      .find(params[:person_id])
    @voiceds = @person.voice_actresses.sort_by do |voice_actress|
      voice_actress.novel.first_release.released
    end

    paginate json: @voiceds, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Database::Person::VoicedSerializer
  end
end
