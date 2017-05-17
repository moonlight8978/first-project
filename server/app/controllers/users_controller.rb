class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, key_transform: :camel_lower
  end

end
