class JsonWebToken
  def self.encode(payload = { })
    payload[:exp] = expiration
    JWT.encode(payload, ENV["APP_SECRET"])
  end

  def self.decode(token)
    return JWT.decode(token, ENV["APP_SECRET"])[0]
  end

  def self.expiration 
    x = ENV.fetch("JWT_EXPIRATION_MINUTES") { 20 }
    x.to_i.minutes.from_now.to_i
  end
end