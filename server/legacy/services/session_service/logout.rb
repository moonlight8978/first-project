class SessionService::Logout
  def initialize(token)
    @token = TokenService.new(token)
  end

  def perform
    return false unless @token.decode_success?
    Security::InvalidToken.new(token: @token.token, expiration: @token.expire_at)
      .save
  end
end
