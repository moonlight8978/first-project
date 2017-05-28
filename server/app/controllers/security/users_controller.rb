class Security::UsersController < ApplicationController
  before_action :set_security_user, only: [:show, :update, :destroy]
  before_action :require_admin, only: :index

  def index
    @users = Security::User.eager_load(:roles).all
    render json: @users, key_transform: :camel_lower, status: :ok
  end

  # GET /security/users/1
  def show
    render json: @security_user
  end

  # POST /security/users
  def create
    @security_user = Security::User.new(security_user_params)

    if @security_user.save
      render json: @security_user, status: :created, location: @security_user
    else
      render json: @security_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /security/users/1
  def update
    if @security_user.update(security_user_params)
      render json: @security_user
    else
      render json: @security_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /security/users/1
  def destroy
    @security_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security_user
      @security_user = Security::User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def security_user_params
      params.fetch(:security_user, {})
    end
end
