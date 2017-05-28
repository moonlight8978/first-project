class Security::ResetPasswordTokensController < ApplicationController
  before_action :set_security_reset_password_token, only: [:show, :update, :destroy]

  # GET /security/reset_password_tokens
  def index
    @security_reset_password_tokens = Security::ResetPasswordToken.all

    render json: @security_reset_password_tokens
  end

  # GET /security/reset_password_tokens/1
  def show
    render json: @security_reset_password_token
  end

  # POST /security/reset_password_tokens
  def create
    @security_reset_password_token = Security::ResetPasswordToken.new(security_reset_password_token_params)

    if @security_reset_password_token.save
      render json: @security_reset_password_token, status: :created, location: @security_reset_password_token
    else
      render json: @security_reset_password_token.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /security/reset_password_tokens/1
  def update
    if @security_reset_password_token.update(security_reset_password_token_params)
      render json: @security_reset_password_token
    else
      render json: @security_reset_password_token.errors, status: :unprocessable_entity
    end
  end

  # DELETE /security/reset_password_tokens/1
  def destroy
    @security_reset_password_token.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security_reset_password_token
      @security_reset_password_token = Security::ResetPasswordToken.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def security_reset_password_token_params
      params.fetch(:security_reset_password_token, {})
    end
end
