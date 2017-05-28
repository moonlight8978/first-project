class ResetPasswordService::RequestReset
  def initialize(params)
    @token = params[:token]
    @params = params.slice(:password)
    @user = Security::ResetPasswordToken.eager_load(:user).find_by_token(@token)
  end

  def reset?
    token = Security::ResetPasswordToken.find_by_token(@token)
    if token.expiration < Time.zone.now
      false
    else
      update && token.destroy
      token.destroyed?
    end
  end

  private
    def update
      @params[:password_updated_at] = Time.zone.now
      @user.update(@params)
    end
end
