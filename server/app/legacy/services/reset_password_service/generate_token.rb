class ResetPasswordService::GenerateToken
  attr_accessor :token
  EXPIRATION = 2.hours.from_now

  def initialize(params)
    @params = params
    @user = Security::User.find_by(
      "user_name = :user_name and email = :email",
      { user_name: params[:user_name], email: params[:email] }
    )
  end

  def represent_user?
    @user.present? ? true : false
  end

  def perform
    @token = SecureRandom.urlsafe_base64(128)
    @user.reset_password_tokens.build(
      token:      @token,
      expiration: EXPIRATION
    )
    @user.save
  end
end
