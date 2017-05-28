class Security::ActivateAccountTokensController < ApplicationController
  before_action :set_security_activate_account_token, only: [:show, :update, :destroy]

  # GET /security/activate_account_tokens
  def index
    @security_activate_account_tokens = Security::ActivateAccountToken.all

    render json: @security_activate_account_tokens
  end

  # GET /security/activate_account_tokens/1
  def show
    render json: @security_activate_account_token
  end

  # POST /security/activate_account_tokens
  def create
    @security_activate_account_token = Security::ActivateAccountToken.new(security_activate_account_token_params)

    if @security_activate_account_token.save
      render json: @security_activate_account_token, status: :created, location: @security_activate_account_token
    else
      render json: @security_activate_account_token.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /security/activate_account_tokens/1
  def update
    if @security_activate_account_token.update(security_activate_account_token_params)
      render json: @security_activate_account_token
    else
      render json: @security_activate_account_token.errors, status: :unprocessable_entity
    end
  end

  # DELETE /security/activate_account_tokens/1
  def destroy
    @security_activate_account_token.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security_activate_account_token
      @security_activate_account_token = Security::ActivateAccountToken.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def security_activate_account_token_params
      params.fetch(:security_activate_account_token, {})
    end
end
