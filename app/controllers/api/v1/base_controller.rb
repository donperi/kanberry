module Api::V1
  class BaseController < ::ActionController::API
    include AuthManager

    rescue_from Exceptions::HttpException, with: :handle_http_exception
    rescue_from ActionController::ParameterMissing, with: :rails_bad_request_exception

    def index
      check_authentication!
      
      render json: {
        message: 'Kanberry API',
        version: 'v1',
        token: auth_token
      }
    end

    def handle_http_exception(error)
      render json: error, status: error.status
    end

    def rails_bad_request_exception(error)
      raise Exceptions::HttpException.bad_request("Parameter [#{error.param}] is required")
    end
  end
end