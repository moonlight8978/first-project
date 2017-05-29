class Security::AccountController < ApplicationController
  before_action :authenticate, only: [:change_password, :show]

  def show
    @current_user = curr_user
    if @current_user.present?
      render json: @current_user, key_transform: :camel_lower, status: :ok
    else
      render_unauthorized
    end
  end

  def change_password
    @user_svc = UserService.new(curr_user, password_params)
    @user_svc.change_password && (head :ok and return)
    head :not_found
  end

  private
    def password_params
      params.permit(:password)
    end
end
