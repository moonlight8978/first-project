class Bussiness::TypesController < ApplicationController
  before_action :set_bussiness_type, only: [:show, :update, :destroy]

  # GET /bussiness/types
  def index
    @bussiness_types = Bussiness::Type.all

    render json: @bussiness_types
  end

  # GET /bussiness/types/1
  def show
    render json: @bussiness_type
  end

  # POST /bussiness/types
  def create
    @bussiness_type = Bussiness::Type.new(bussiness_type_params)

    if @bussiness_type.save
      render json: @bussiness_type, status: :created, location: @bussiness_type
    else
      render json: @bussiness_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bussiness/types/1
  def update
    if @bussiness_type.update(bussiness_type_params)
      render json: @bussiness_type
    else
      render json: @bussiness_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bussiness/types/1
  def destroy
    @bussiness_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bussiness_type
      @bussiness_type = Bussiness::Type.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bussiness_type_params
      params.fetch(:bussiness_type, {})
    end
end
