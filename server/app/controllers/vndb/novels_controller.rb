class Vndb::NovelsController < ApplicationController
  before_action :set_vndb_novel, only: [:show, :update, :destroy]

  # GET /vndb/novels
  def index
    @vndb_novels = Vndb::Novel.all

    render json: @vndb_novels
  end

  # GET /vndb/novels/1
  def show
    render json: @vndb_novel
  end

  # POST /vndb/novels
  def create
    @vndb_novel = Vndb::Novel.new(vndb_novel_params)

    if @vndb_novel.save
      render json: @vndb_novel, status: :created, location: @vndb_novel
    else
      render json: @vndb_novel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vndb/novels/1
  def update
    if @vndb_novel.update(vndb_novel_params)
      render json: @vndb_novel
    else
      render json: @vndb_novel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vndb/novels/1
  def destroy
    @vndb_novel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vndb_novel
      @vndb_novel = Vndb::Novel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vndb_novel_params
      params.fetch(:vndb_novel, {})
    end
end
