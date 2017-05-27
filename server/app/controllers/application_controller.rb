class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

private
  # Main authenticate helpers
  def authenticate
    render_unauthorized unless authenticated?
  end

  def require_admin
    require_role('ROLE_ADMIN')
  end

  def require_moderator
    require_role('ROLE_MODERATOR')
  end

  def curr_user
    token = TokenService.new(token_from_request)
    return @current_user unless token.decode_success?
    user = User.find(token.user_id)
    if user
      @current_user ||= user
    end
  end

  # Supported
  def authenticated?
    token_not_in_black_list? &&
    curr_user.present? &&
    user_activated?(curr_user) &&
    token_created_after_changing_password?
  end

  def require_role(role)
    render_unauthorized and return unless authenticated?
    @current_user = curr_user
    render_unauthorized and return unless @current_user.present?
    roles = @current_user.roles
    render_unauthorized and return unless roles.include?(role)
  end

  def user_activated?(current_user)
    current_user.activated
  end

  def token_created_after_changing_password?
    token = TokenService.new(token_from_request)
    @current_user = User.find(token.user_id)
    token.created_at >= @current_user[:password_updated_at]
  end

  def token_not_in_black_list?
    token = InvalidToken.find_by_token(token_from_request)
    token.nil?
  end

  def token_from_request
    authenticate_or_request_with_http_token do |token, _options|
      token
    end
  end

  # Render methods
  def render_unauthorized
    render json: { message: 'Unauthorized' }, status: :unauthorized
  end

  def render_not_found
    render json: { message: 'Not found!' }, status: :not_found
  end
end
