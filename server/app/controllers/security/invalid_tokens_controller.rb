class Security::InvalidTokensController < ApplicationController
  before_action :set_security_invalid_token, only: [:show, :update, :destroy]

  # GET /security/invalid_tokens
  def index
    @security_invalid_tokens = Security::InvalidToken.all

    render json: @security_invalid_tokens
  end

  # GET /security/invalid_tokens/1
  def show
    render json: @security_invalid_token
  end

  # POST /security/invalid_tokens
  def create
    @security_invalid_token = Security::InvalidToken.new(security_invalid_token_params)

    if @security_invalid_token.save
      render json: @security_invalid_token, status: :created, location: @security_invalid_token
    else
      render json: @security_invalid_token.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /security/invalid_tokens/1
  def update
    if @security_invalid_token.update(security_invalid_token_params)
      render json: @security_invalid_token
    else
      render json: @security_invalid_token.errors, status: :unprocessable_entity
    end
  end

  # DELETE /security/invalid_tokens/1
  def destroy
    @security_invalid_token.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security_invalid_token
      @security_invalid_token = Security::InvalidToken.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def security_invalid_token_params
      params.fetch(:security_invalid_token, {})
    end
end
