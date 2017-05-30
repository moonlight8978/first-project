class Security::SessionController < ApplicationController
  before_action :authenticate, only: :logout

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

private

  def login_params
    params.permit(:login, :password)
  end
end
