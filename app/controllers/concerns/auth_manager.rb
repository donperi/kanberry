module AuthManager
  extend ActiveSupport::Concern

  def check_authentication!
    if authorization_header.nil?
      raise Api::V1::Exceptions::HttpException.unauthorized("Authorization header missing")
    end

    authenticate_user(User.find(auth_token["user_id"].to_i))
  end

  def authenticate_user(user)
    @current_user = user
  end


  def current_user
    @current_user || nil
  end


  def auth_token
    @auth_token ||= begin
      JsonWebToken.decode(authorization_header.split(' ')[1])
    rescue Exception => error
      raise Api::V1::Exceptions::HttpException.unauthorized("Invalid Authorization Token", 402)
    end
  end


  def create_token(user)
    JsonWebToken.encode({ user_id: user.id })
  end

  def authorization_header
    request.headers["Authorization"]
  end
end