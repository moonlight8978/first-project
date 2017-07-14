class Api::V1::Db::Novels::CharactersController < ApplicationController
  def index
    @characters = ::Db::Novel::Character.all

    paginate json: @characters, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      except: [:novel, :voice_actresses],
      each_serializer: Api::V1::Db::Novel::Character::CharacterListSerializer
  end

  def show
    @character = ::Db::Novel::Character
      .includes(character_novels: [:novel, :people])
      .find(params[:id])

    render json: @character, key_transform: :camel_lower, status: :ok,
      include: [novels: :voice_actresses],
      serializer: Api::V1::Db::Novel::Character::CharacterDetailSerializer
  end

  def create
    create_svc = NovelService::AddCharacter.new(params[:novel_id], create_character_params)

    create_svc.perform
    if create_svc.errors?
      render json: create_svc.errors, status: :bad_request
    else
      render_ok
    end
  end

  def update
    update_svc = CharacterService::UpdateCharacter.new(params[:id], update_character_params)

    update_svc.perform
    if update_svc.errors?
      render json: update_svc.errors, status: :bad_request
    else
      render_ok
    end
  end

  # def destroy

  # end

  def index_novel
    novel = ::Db::Novel.includes(characters: :people).find(params[:novel_id])
    @characters = GroupSerializeService
      .new(novel.characters, :role, Api::V1::Db::Novel::CharacterSerializer)
      .perform
      .result

    render json: @characters, status: :ok
  end

  # Add existing character to novel
  def create_novel

  end

  # Remove a character from novel (if character was in another novel), else destroy
  def destroy_novel

  end

private
  def create_character_params
    params.permit(
      :name, :name_en, :birthday_day, :birthday_month, :gender,
      :weight, :height, :bust, :waist, :hips, :blood_type, :image, :role,
      :description, :description_en
    )
  end

  def update_character_params
    params.permit(
      :name, :name_en, :birthday_day, :birthday_month, :gender,
      :weight, :height, :bust, :waist, :hips, :blood_type, :image, :role,
      :description, :description_en
    )
  end
end
