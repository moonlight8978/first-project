class Api::V1::Vndb::CharactersController < ApplicationController
  ROLE = {
    0 => :protagonist,
    1 => :main,
    2 => :side
  }

  def index
    @novel = ::Vndb::Novel.includes(characters: :people).find(params[:novel_id])
    characters = @novel.characters.group_by(&:role)
    @characters = characters.map do |role, characters|
      [ROLE[role], serialize(characters)]
    end.to_h
    render json: @characters, status: :ok
  end

  def show
    @character = ::Vndb::Character.find(params[:id])

    render json: @character, key_transform: :camel_lower, status: :ok,
      include: [:novel, :voice_actresses],
      serializer: Api::V1::Vndb::Novel::CharacterSerializer
  end

private
  def serialize(characters)
    characters.map do |character|
      ActiveModelSerializers::SerializableResource.new(
        character,
        serializer: Api::V1::Vndb::Novel::CharacterSerializer,
        root: false,
        key_transform: :camel_lower
      )
    end
  end
end
