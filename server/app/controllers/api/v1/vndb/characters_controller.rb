class Api::V1::Vndb::CharactersController < ApplicationController
  ROLE = { 0 => :protagonist, 1 => :main, 2 => :side }

  def index
    @characters = ::Vndb::Character.all

    paginate json: @characters, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      except: [:novel, :voice_actresses],
      each_serializer: Api::V1::Vndb::CharacterSerializer
  end

  def show
    @character = ::Vndb::Character.find(params[:id])

    render json: @character, key_transform: :camel_lower, status: :ok,
      include: [:novel, :voice_actresses],
      serializer: Api::V1::Vndb::Novel::CharacterSerializer
  end

  def create

  end

  def update

  end

  def destroy

  end

  def index_novel
    @novel = ::Vndb::Novel.includes(characters: :people).find(params[:novel_id])
    characters_need_to_serialize = @novel.characters.group_by(&:role)
    @characters = GroupSerializeService
      .new(characters_need_to_serialize, ROLE, Api::V1::Vndb::Novel::CharacterSerializer)
      .perform
      .result

    render json: @characters, status: :ok
  end

  def index_person
    @person = ::Vndb::Person
      .includes({ characters: { novels: :releases } }, :country)
      .find(params[:person_id])
    @voiceds = @person.voice_actresses.sort_by do |voice_actress|
      voice_actress.novel.first_release.released
    end

    paginate json: @voiceds, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Vndb::Person::VoicedSerializer
  end
end
