class Api::V1::BaseController < ::ActionController::API
  include AuthManager

  rescue_from Exceptions::HttpException, with: :handle_http_exception

  before_action :check_authentication!

  def index
    render json: {
      message: 'Kanberry API',
      version: 'v1'
    }
  end

  def handle_http_exception(error)
    p error
    render json: error.to_json, status: error.status
  end
end