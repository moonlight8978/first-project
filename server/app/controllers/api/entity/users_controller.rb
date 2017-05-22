class Api::Entity::UsersController < ApplicationController
  before_action :require_admin, only: :index

  def index
    @users = User.all
    render json: @users, key_transform: :camel_lower, status: :ok
  end
end
