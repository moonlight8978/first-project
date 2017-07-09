class Api::V1::Db::Novels::CharactersController < ApplicationController
  def index
    @characters = ::Db::Novel::Character.all

    paginate json: @characters, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      except: [:novel, :voice_actresses],
      each_serializer: Api::V1::Db::Novel::Character::CharacterListSerializer
  end

  def show
    @character = ::Db::Novel::Character.find(params[:id])

    render json: @character, key_transform: :camel_lower, status: :ok,
      include: [:novel, :voice_actresses],
      serializer: Api::V1::Db::Novel::Character::CharacterDetailSerializer
  end

  def create

  end

  def update
    p params
  end

  def destroy

  end

  def index_novel
    novel = ::Db::Novel.includes(characters: :people).find(params[:novel_id])
    @characters = GroupSerializeService
      .new(novel.characters, :role, Api::V1::Db::Novel::CharacterSerializer)
      .perform
      .result

    render json: @characters, status: :ok
  end
end
