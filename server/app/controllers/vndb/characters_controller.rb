class Vndb::CharactersController < ApplicationController
  before_action :set_vndb_character, only: [:show, :update, :destroy]

  # GET /vndb/characters
  def index
    @vndb_characters = Vndb::Character.all

    render json: @vndb_characters
  end

  # GET /vndb/characters/1
  def show
    render json: @vndb_character
  end

  # POST /vndb/characters
  def create
    @vndb_character = Vndb::Character.new(vndb_character_params)

    if @vndb_character.save
      render json: @vndb_character, status: :created, location: @vndb_character
    else
      render json: @vndb_character.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vndb/characters/1
  def update
    if @vndb_character.update(vndb_character_params)
      render json: @vndb_character
    else
      render json: @vndb_character.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vndb/characters/1
  def destroy
    @vndb_character.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vndb_character
      @vndb_character = Vndb::Character.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vndb_character_params
      params.fetch(:vndb_character, {})
    end
end
