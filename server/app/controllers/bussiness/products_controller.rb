class Bussiness::ProductsController < ApplicationController
  before_action :set_bussiness_product, only: [:show, :update, :destroy]

  # GET /bussiness/products
  def index
    @bussiness_products = Bussiness::Product.all

    render json: @bussiness_products
  end

  # GET /bussiness/products/1
  def show
    render json: @bussiness_product
  end

  # POST /bussiness/products
  def create
    @bussiness_product = Bussiness::Product.new(bussiness_product_params)

    if @bussiness_product.save
      render json: @bussiness_product, status: :created, location: @bussiness_product
    else
      render json: @bussiness_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bussiness/products/1
  def update
    if @bussiness_product.update(bussiness_product_params)
      render json: @bussiness_product
    else
      render json: @bussiness_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bussiness/products/1
  def destroy
    @bussiness_product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bussiness_product
      @bussiness_product = Bussiness::Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bussiness_product_params
      params.fetch(:bussiness_product, {})
    end
end
