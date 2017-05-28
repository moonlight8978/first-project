class Security::RolesController < ApplicationController
  before_action :set_security_role, only: [:show, :update, :destroy]

  # GET /security/roles
  def index
    @security_roles = Security::Role.all

    render json: @security_roles
  end

  # GET /security/roles/1
  def show
    render json: @security_role
  end

  # POST /security/roles
  def create
    @security_role = Security::Role.new(security_role_params)

    if @security_role.save
      render json: @security_role, status: :created, location: @security_role
    else
      render json: @security_role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /security/roles/1
  def update
    if @security_role.update(security_role_params)
      render json: @security_role
    else
      render json: @security_role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /security/roles/1
  def destroy
    @security_role.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security_role
      @security_role = Security::Role.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def security_role_params
      params.fetch(:security_role, {})
    end
end
