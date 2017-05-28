class Vndb::PublishesController < ApplicationController
  before_action :set_vndb_publish, only: [:show, :update, :destroy]

  # GET /vndb/publishes
  def index
    @vndb_publishes = Vndb::Publish.all

    render json: @vndb_publishes
  end

  # GET /vndb/publishes/1
  def show
    render json: @vndb_publish
  end

  # POST /vndb/publishes
  def create
    @vndb_publish = Vndb::Publish.new(vndb_publish_params)

    if @vndb_publish.save
      render json: @vndb_publish, status: :created, location: @vndb_publish
    else
      render json: @vndb_publish.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vndb/publishes/1
  def update
    if @vndb_publish.update(vndb_publish_params)
      render json: @vndb_publish
    else
      render json: @vndb_publish.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vndb/publishes/1
  def destroy
    @vndb_publish.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vndb_publish
      @vndb_publish = Vndb::Publish.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vndb_publish_params
      params.fetch(:vndb_publish, {})
    end
end
