class Security::RegisterController < ApplicationController
  def register
    @user_svc = RegisterService::Register.new(register_params)
    if @user_svc.user_already_exist?
      head :conflict
    else
      render_unauthorized and return unless @user_svc.register?
      RegisterMailer.complete_register(@user_svc.user)
        .deliver_later
      head :ok
    end
  end

  def register_confirm
    @confirm_svc = RegisterService::Confirm.new(confirm_token)
    if @confirm_svc.activate?
      head :ok
    else
      render_unauthorized
    end
  end

  def test
    @user = Security::User.find(7)
    ApplicationMailer::Security::RegisterMailer
      .complete_register(@user)
      .deliver_later(wait: 10.seconds)
  end

private
  def register_params
    params.permit(:user_name, :email, :password)
  end

  def confirm_token
    params.permit(:token)[:token]
  end
end
