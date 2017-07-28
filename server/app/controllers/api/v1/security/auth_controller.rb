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

  def register
    @register_svc = RegisterService::Register.new(register_params).perform
    p @register_svc.errors?

    if @register_svc.errors?
      render json: @register_svc.errors.detail, status: @register_svc.errors.status
    else
      RegisterMailer.complete_register(@register_svc.user, @register_svc.token)
        .deliver_later
      head :ok
    end
  end

  def register_confirm
    @confirm_svc = RegisterService::Confirm
      .new(params[:email], params[:token])
      .perform

    if @confirm_svc.errors?
      render json: @confirm_svc.errors.detail, status: @confirm_svc.errors.status
    else
      head :ok
    end
  end

private

  def login_params
    params.permit(:login, :password)
  end

  def register_params
    params.permit(
      :user_name, :email, :password, :password_confirmation, :first_name, :middle_name,
      :last_name
    )
  end
end
