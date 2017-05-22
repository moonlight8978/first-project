class UserService
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def current_user?(current_user)
    @user == current_user
  end

  def present?
    @user.present? ? true : false
  end

  def update(params, change_password = false)
    params[:password_updated_at] = Time.zone.now if change_password
    @user.update(params)
  end

  def generate_reset_password_token
    token = SecureRandom.urlsafe_base64(128)
    service = ResetPasswordToken.new(
      user_id: @user.id,
      token: token,
      expiration: 2.hours.from_now
    )
    service.save ? token : nil
  end

  def reset_password(password_params, token)
    token = ResetPasswordToken.find_by_token(token)
    if token.expiration < Time.zone.now
      false
    else
      update(password_params, true) && token.destroy
    end
  end
end
