class JsonWebToken
  SECRET_KEY = Rails.application.secret_key_base
  ALGORITHM = "HS256".freeze

  # Generate a token that expires in 1 hour by default
  def self.encode(payload, exp = 1.hour.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY, ALGORITHM)
  end

  # Decode the token and return the payload
  def self.decode(token)
    options = {
      algorithm: ALGORITHM,
      verify_expiration: true
    }
    decoded = JWT.decode(token, SECRET_KEY, true, options)[0]
    HashWithIndifferentAccess.new(decoded)
  rescue JWT::DecodeError, JWT::ExpiredSignature
    nil
  end
end
