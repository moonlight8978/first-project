class TokenService
  attr_accessor :token, :payload

  def initialize(token)
    @token = token
    @payload = JsonWebToken.decode(token)
  end

  def user_id
    @payload.present? ? @payload['id'] : nil
  end

  def expire_at
    @payload.present? ? Time.zone.at(@payload['exp']) : nil
  end

  def created_at
    @payload.present? ? Time.zone.at(@payload['exp'] - 30 * 60) : nil
  end
end
