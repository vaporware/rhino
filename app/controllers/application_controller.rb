class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def authenticate_request!
      unless user_id_in_token?
        auth_error
        return
      end
      @current_user = User.find(auth_token[:user_id])
    rescue JWT::VerificationError, JWT::DecodeError
      auth_error
    end

  private
    def auth_error
      render json: { errors: ["Not Authenticated"] }, status: :unauthorized
    end

    def auth_token
      @auth_token ||= JsonWebToken.decode(http_token)
    end

    def http_token
      @http_token ||= if request.headers["Authorization"].present?
        request.headers["Authorization"].split(" ").last
      end
    end

    def user_id_in_token?
      http_token && auth_token && auth_token[:user_id].to_i
    end
end
