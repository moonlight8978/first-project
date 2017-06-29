class Security::SessionController < ApplicationController
  before_action :authenticate, only: :logout

  def login
    @login_svc = SessionService::Login.new(login_params)
    if @login_svc.perform
      token = @login_svc.token
      render json: { token: token }, status: :ok
    elsif @login_svc.account_not_activated?
      @activate_token_svc = RegisterService::GenerateToken.new(@login_svc.user)
      @activate_token_svc.perform
      RegisterMailer.complete_register(@login_svc.user, @activate_token_svc.token)
        .deliver_later
    else
      render_unauthorized
    end
  end

  def logout
    @logout_svc = SessionService::Logout.new(token_from_request)
    @logout_svc.perform && (head :ok and return)
    render_unauthorized
  end

private

  def login_params
    params.permit(:login, :password)
  end
end
