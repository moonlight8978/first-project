class JsonWebToken
  ALGORITHM = 'HS256'

  def self.encode(payload)
    JWT.encode(payload, secret_key, ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, secret_key, true, { algorithm: ALGORITHM }).first
  end

private
  def self.secret_key
    Rails.application.secrets.secret_key
  end
end