class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  ## Main authenticate helpers

  # Allow logged users access to resources
  def authenticate
    render_unauthorized unless authenticated?
  end

  # Admin-specific resources
  def require_admin
    require_role('ROLE_ADMIN')
  end

  # Moderator up to Admin can access
  def require_moderator
    require_role('ROLE_MODERATOR')
  end

  # Return user that send request by fetching JWT
  def curr_user
    token = TokenService.new(token_from_request)
    return @current_user unless token.decode_success?
    user = Security::User.find(token.user_id)
    if user
      @current_user ||= user
    end
  end

private

  # Get token from request header
  def token_from_request
    # return nil unless request.headers['HTTP_AUTHORIZATION'].present?
    # auth = request.headers['HTTP_AUTHORIZATION'].split(' ')
    # return nil unless auth.size == 2
    # auth.last
    authenticate_with_http_token do |token, _options|
      token
    end
  end

  ## Render methods
  def render_unauthorized
    render json: { message: 'Unauthorized' }, status: :unauthorized
  end

  def render_ok(data = { message: 'Everythingは大丈夫です！'})
    render json: data, status: :ok
  end

  def render_not_found
    error = ErrorMessage.new(message: 'Record which you want seem not be exists!')
    render json: error, status: :not_found
  end

  # Check if user has been logged or not
  def authenticated?
    token_not_in_black_list? &&
    curr_user.present? &&
    user_activated?(curr_user) &&
    token_created_after_changing_password?
  end

  # User must have specific roles to continue
  def require_role(role)
    (render_unauthorized and return) unless authenticated?
    @current_user = curr_user
    (render_unauthorized and return) unless @current_user.present?
    roles = @current_user.roles.map(&:role)
    (render_unauthorized and return) unless roles.include?(role)
  end

  # Check if user's account has been activated
  def user_activated?(current_user)
    current_user.activated
  end

  # Check if token is valid (create after changing password)
  def token_created_after_changing_password?
    token = TokenService.new(token_from_request)
    @current_user = Security::User.find(token.user_id)
    token.created_at >= @current_user[:password_updated_at]
  end

  # Check if token in black list (logout, change password)
  def token_not_in_black_list?
    return false unless token_from_request
    Security::InvalidToken.find_by_token(token_from_request).nil?
  end
end
