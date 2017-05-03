class ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products, status: :ok
  end

  def create
    puts params.inspect
    type = params[:product_type]
    if (type == 'Game')
      @product = Product.new(product_params)
      @product.save
      @ref = @product.build_game_product_ref
      @ref.save
      @game = @ref.build_game(game_params)
      @game.save
      head :ok
    elsif (type == 'CD')
      @product = Product.new(product_params)
      @product.save
      @ref = @product.build_cd_product_ref
      @ref.save
      @cd = @ref.build_cd(cd_params)
      @cd.save
      head :ok
    else
      head :bad_request
    end
  end

  private
    def product_params
      params.permit(:product_type, :price)
    end
    def game_params
      params.permit(:title, :original)
    end
    def cd_params
      params.permit(:title)
    end
end
