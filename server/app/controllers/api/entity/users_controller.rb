class Api::Entity::UsersController < ApplicationController
  before_action :require_admin, only: :index

  def index
    @users = User.eager_load(:roles).all
    render json: @users, key_transform: :camel_lower, status: :ok
  end
end
