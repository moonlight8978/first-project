class RegisterService::GenerateToken < ApplicationService
  attr_accessor :user, :token
  EXPIRATION = 2.hours.from_now

  def initialize(user)
    @user = user
    super()
  end

  def perform
    begin
      @token = SecureRandom.urlsafe_base64(128)
      @activate = @user.activate_account_tokens.create(
        token:      @token,
        expiration: EXPIRATION
      )
    end while @activate.errors.any?

    @token
  end
end
