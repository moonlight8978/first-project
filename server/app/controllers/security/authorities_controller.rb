class Security::AuthoritiesController < ApplicationController
  before_action :set_security_authority, only: [:show, :update, :destroy]

  # GET /security/authorities
  def index
    @security_authorities = Security::Authority.all

    render json: @security_authorities
  end

  # GET /security/authorities/1
  def show
    render json: @security_authority
  end

  # POST /security/authorities
  def create
    @security_authority = Security::Authority.new(security_authority_params)

    if @security_authority.save
      render json: @security_authority, status: :created, location: @security_authority
    else
      render json: @security_authority.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /security/authorities/1
  def update
    if @security_authority.update(security_authority_params)
      render json: @security_authority
    else
      render json: @security_authority.errors, status: :unprocessable_entity
    end
  end

  # DELETE /security/authorities/1
  def destroy
    @security_authority.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security_authority
      @security_authority = Security::Authority.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def security_authority_params
      params.fetch(:security_authority, {})
    end
end
