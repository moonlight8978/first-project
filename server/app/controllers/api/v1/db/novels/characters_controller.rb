class Api::V1::Db::Novels::CharactersController < ApplicationController
  def index
    @characters = ::Db::Novel::Character.all

    paginate json: @characters, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      except: [:novel, :voice_actresses],
      each_serializer: Api::V1::Vndb::CharacterSerializer
  end

  def show
    @character = ::Db::Novel::Character.find(params[:id])

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
    @novel = ::Db::Novel.includes(characters: :people).find(params[:novel_id])
    characters_need_to_serialize = @novel.characters.group_by(&:role)
    @characters = GroupSerializeService
      .new(characters_need_to_serialize, ROLE, Api::V1::Vndb::Novel::CharacterSerializer)
      .perform
      .result

    render json: @characters, status: :ok
  end
end
