module AuthManager
  extend ActiveSupport::Concern

  def check_authentication!
    if authorization_header.nil?
      raise Api::V1::Exceptions::HttpException.new("Authorization header missing", 402)
    end
  end

  def authorization_header
    request.headers["Authorization"]
  end
end