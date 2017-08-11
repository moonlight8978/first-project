class SessionService::SocialLogin::Google < ApplicationService
  include SessionService::SocialLogin::CreateUser
  
  def initialize(code)
    @code = code
    super()
  end

  def perform
    begin
      response = GoogleAuth.authorize(@code)
      user = JsonWebToken.decode(response['id_token'], false)
      @user = Security::User.find_by(email: user['email'])
      @oauth = Security::User::Oauth
        .includes(user: :roles)
        .find_by(provider: 'google', uid: user['sub'])
      if @oauth.present? 
        return_existing_user
      elsif @user.present?
        email_already_exist
      else
        create_user_with_oauth(response, user)
      end
    rescue Signet::AuthorizationError
      unauthorized
    end
    
    self
  end
  
  def result
    { user: @user, token: @user.token }
  end

private

  def unauthorized
    @errors.add!(unauthorized: 'Unauthorized!')
    @errors.set_status(:unauthorized)
  end
  
  def create_user_with_oauth(response, user)
    create_user(
      email: user['email'],
      uid: user['sub'],
      token: response['access_token'],
      provider: 'google',
      expires_in: response['expires_in'].to_i
    ).present? || errors_occurred
  end
  
  def return_existing_user
    @user = @oauth.user
  end
  
  def already_existed
    @errors.add!(user: 'User has already existed!')
    @errors.set_status(:conflict)
  end
  
  def email_already_exist
    @errors.add!(email: 'Email has already existed!')
    @errors.set_status(:conflict)
  end
end
