class JsonWebToken
  ALGORITHM = 'HS256'
  EXPIRATION = 30 * 60

  def self.encode(payload)
    payload[:exp] = Time.zone.now.to_i + EXPIRATION
    JWT.encode(payload, secret_key, ALGORITHM)
  end

  def self.decode(token)
    begin
      JWT.decode(token, secret_key, true, algorithm: ALGORITHM).first
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
      nil
    end
  end

private
  def self.secret_key
    Rails.application.secrets.secret_key
  end
end
