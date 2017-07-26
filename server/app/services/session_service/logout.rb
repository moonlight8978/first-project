class SessionService::Logout < ApplicationService
  def initialize(token)
    @token = TokenService.new(token)
    super()
  end

  def perform
    unless @token.decode_success?
      @errors.add!(message: 'Token is invalid!')
      return self
    end

    Security::InvalidToken.new(token: @token.token, expiration: @token.expire_at)
      .save

    self
  end
end
