class AuthController < ApplicationController
  before_action :require_admin, only: :destroy
  before_action :authenticate, only: :logout

  def login
    if params.fetch(:user_name, {}).present?
      @user = User.find_by_user_name(params[:user_name])
    elsif params.fetch(:email, {}).present?
      @user = User.find_by_email(params[:email])
    else
      render_unauthorized and return
    end

    if @user && @user.authenticate(params[:password])
      token = @user.token
      render json: { token: token }, status: :ok
    else
      render_unauthorized
    end
  end

  def register
    @users = User.where(
      "user_name = :user_name or email = :email",
      { user_name: params[:user_name], email: params[:email] }
    )
    if @users.empty?
      if User.create(register_params)
        head :ok
      else
        head :unauthorized
      end
    else
      head :conflict
    end
  end

  def logout
    token = TokenService.new(token_from_request)
    head :unauthorized and return unless token.payload.present?
    @token = InvalidToken.new(
      token:      token.token,
      expiration: token.expire_at
    )
    @token.save
  end

  def destroy # destroy_token
    expired_token = InvalidToken
      .where("expiration <= :expiration", { expiration: Time.zone.now })
      .pluck(:id)
    InvalidToken.delete(expired_token)
    head :no_content
  end

  def reset # reset_password

  end

  def change # change_password

  end

private
  def register_params
    params.require(:auth).permit(:email, :user_name, :password)
  end
end
