class Api::Security::AuthController < ApplicationController
  before_action :authenticate, only: :logout

  def register
    @user_svc = RegisterService.new(register_params)
    if @user_svc.user_already_exist?
      head :conflict
    else
      render_unauthorized and return unless @user_svc.register?
      ApplicationMailer::Security::RegisterMailer
        .complete_register(@user_svc.user)
        .deliver_later
      head :ok
    end
  end

  def register_confirm
    @confirm_svc = ConfirmService.new(confirm_token)
    if @confirm_svc.activate?
      head :ok
    else
      render_unauthorized
    end
  end

  def login
    @session_svc = SessionService::Login.new(login_params)
    if @session_svc.login?
      token = @session_svc.user.token
      render json: { token: token }, status: :ok
    else
      render_unauthorized
    end
  end

  def logout
    @session_svc = SessionService::Logout.new(token_from_request)
    @session_svc.logout? && (head :ok and return)
    render_unauthorized
  end

  def test
    @user = User.find(7)
    ApplicationMailer::Security::RegisterMailer
      .complete_register(@user)
      .deliver_later(wait: 10.seconds)
  end

private
  def login_params
    params.permit(:login, :password)
  end

  def register_params
    params.permit(:user_name, :email, :password)
  end

  def confirm_token
    params.permit(:token)[:token]
  end
end
