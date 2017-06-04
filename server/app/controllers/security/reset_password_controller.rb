class Security::ResetPasswordController < ApplicationController
  def send_token
    @generate_rspw_token_svc = ResetPasswordService::GenerateToken.new(forget_password_params)
    if @generate_rspw_token_svc.represent_user? && @generate_rspw_token_svc.perform
      render json: { token: @generate_rspw_token_svc.token }, status: :ok
    else
      head :not_found
    end
  end

  def reset_password
    @reset_svc = ResetPasswordService::RequestReset.new(reset_password_params)
    if @reset_svc.represent_user? && @reset_svc.perform
      head :no_content
    else
      render_unauthorized
    end
  end

private

  def forget_password_params
    params.permit(:user_name, :email)
  end

  def reset_password_params
    params.permit(:token, :password)
  end
end
