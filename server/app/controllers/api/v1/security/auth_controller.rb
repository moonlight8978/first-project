class Api::V1::Security::AuthController < ApplicationController
  def login
    login_svc = SessionService::Login.new(login_params)
      .perform

    if login_svc.errors?
      render json: login_svc.errors.detail, status: :unauthorized
    else
      render json: login_svc.user, status: :ok, key_transform: :camel_lower,
        serializer: Api::V1::Security::User::UserDetailSerializer
      response.headers['x-token'] = login_svc.token
    end

    # if @login_svc.perform
    #   token = @login_svc.token
    #   render json: { token: token }, status: :ok
    #   response.headers['x-token'] = token
    # elsif @login_svc.account_not_activated?
    #   @activate_token_svc = RegisterService::GenerateToken.new(@login_svc.user)
    #   @activate_token_svc.perform
    #   RegisterMailer.complete_register(@login_svc.user, @activate_token_svc.token)
    #     .deliver_later
    # else
    #   render_unauthorized
    # end
  end

  def logout
    p request.headers['HTTP_AUTHORIZATION']
    @logout_svc = SessionService::Logout.new(token_from_request).perform

    render_ok
  end

private

  def login_params
    params.permit(:login, :password)
  end
end
