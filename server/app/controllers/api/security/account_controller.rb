class Api::Security::AccountController < ApplicationController
  before_action :authenticate, only: [:change_password, :show]

  def show
    @current_user = curr_user
    if @current_user.present?
      render json: @current_user, key_transform: :camel_lower, status: :ok
    else
      render_unauthorized
    end
  end

  def change_password # change_password
    @user = UserService.new(User.find(params[:id]))
    render_unauthorized and return unless @user.current_user?(curr_user)
    if @user.update(password_params, true)
      head :no_content
    else
      head :conflict
    end
  end

  # reset_password
  def send_token
    @user = UserService.new(User.find_by(
      "user_name = :user_name and email = :email",
      { user_name: params[:user_name],
        email:     params[:email] })
    )
    if @user.present?
      @token = @user.generate_reset_password_token
      unless @token.nil?
        render json: { token: @token }, status: :ok
      else
        render_unauthorized
      end
    else
      head :not_found
    end
  end

  def reset_password
    token = ResetPasswordToken.find_by_token(reset_password_token)
    if token.present?
      @user = UserService.new(token.user)
      if @user.present?
        @user.reset_password(password_params, reset_password_token)
        head :no_content
      else
        render_unauthorized
      end
    else
      render_unauthorized
    end
  end

private
  def password_params
    params.permit(:password)
  end

  def reset_password_token
    params.permit(:token)[:token]
  end
end
