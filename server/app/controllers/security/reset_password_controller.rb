class Api::Security::ResetPasswordController < ApplicationController
  def send_token
    @reset_svc = ResetPasswordService::GenerateToken.new(forget_password_params)
    if @reset_svc.represent_user? && @reset_svc.generate_token?
      render json: { token: @reset_svc.token }, status: :ok
    else
      head :not_found
    end
  end

  def reset_password
    @reset_svc = ResetPasswordService::RequestReset.new(reset_password_params)
    if @reset_svc.represent_user? && @reset_svc.reset?
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
