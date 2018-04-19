module Api::V1
  class SessionController < BaseController
    def login
      if (user.nil? || !user.authenticate(login_params[:password]))
        raise invalid_user_exception
      end

      render json: Response.new(data: { token: create_token(user) })
    end

    def user
      User.find_by(email: login_params[:email])
    end

    def login_params
      params.require(:email)
      params.require(:password)
      params
    end

    def invalid_user_exception
      Exceptions::HttpException.unauthorized("Invalid Email or Password")
    end
  end
end