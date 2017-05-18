class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, key_transform: :camel_lower
  end

  def show
    @current_user = curr_user
    render json: @current_user, key_transform: :camel_lower
  end
end
