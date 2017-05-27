class TokenService
  attr_accessor :token, :payload

  def initialize(token)
    @token = token
    @payload = JsonWebToken.decode(token)
  end

  def decode_success?
    @payload.present?
  end

  def user_id
    decode_success? ? @payload['id'] : nil
  end

  def expire_at
    decode_success? ? Time.zone.at(@payload['exp']) : nil
  end

  def created_at
    decode_success? ? Time.zone.at(@payload['exp'] - 30 * 60) : nil
  end
end
