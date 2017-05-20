class UsersController < ApplicationController
  before_action :require_admin, only: :index

  def index
    @users = User.all
    render json: @users, key_transform: :camel_lower, status: :ok
  end

  def show
    @current_user = curr_user
    if @current_user.present?
      render json: @current_user, key_transform: :camel_lower, status: :ok
    else
      head :unauthorized
    end
  end
end
