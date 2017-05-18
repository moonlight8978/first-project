class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate, only: [:require_admin, :require_moderator]

private
  def authenticate
    head :unauthorized and return unless authenticated?
  end

  def require_admin
    @current_user = curr_user
    @role = Role.joins(:authorities).where('authorities.user_id' => @current_user[:id]).pluck(:role)
    head :unauthorized and return unless @role.include?('ROLE_ADMIN')
  end

  def require_moderator
    @current_user = curr_user
    @role = Role.joins(:authorities).where('authorities.user_id' => @current_user[:id]).pluck(:role)
    head :unauthorized and return unless @role.include?('ROLE_MODERATOR')
  end

  def authenticated?
    true if curr_user
  end

  def curr_user
    begin
      user_from_request = JsonWebToken.decode(token_from_request).symbolize_keys
    rescue JWT::DecodeError, JWT::VerificationError
      return nil
    end

    user = User.find(user_from_request[:id])
    if user
      @current_user ||= user
    end
  end

  def token_from_request
    authenticate_or_request_with_http_token do |token, _options|
      token
    end
  end
end
