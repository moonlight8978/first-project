class RegisterService::GenerateToken
  attr_accessor :user, :token
  EXPIRATION = 2.hours.from_now

  def initialize(user)
    @user = user
  end

  def perform
    @token = SecureRandom.urlsafe_base64(128)
    @user.activate_account_tokens.build(
      token:      @token,
      expiration: EXPIRATION
    )
    @user.save
  end
end
