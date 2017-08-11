class SessionService::SocialLogin::Facebook < ApplicationService
  include SessionService::SocialLogin::CreateUser
  
  # options = {}
  # params {string} access_token
  # params {int}    expires_in
  def initialize(options = {})
    @access_token = options[:access_token]
    @expires_in = options[:expires_in]
    super()
  end

  def perform
    user = FacebookAuth.new(@access_token).authorize
    if user
      @oauth = Security::User::Oauth
        .includes(user: :roles)
        .find_by(provider: 'facebook', uid: user['id'])
      user['email'] && (@user = Security::User.find_by(email: user['email']))
      
      if @oauth.present?
        return_existing_user
      elsif @user.present?
        email_already_exist
      else
        create_user_with_oauth(user)
      end
    else
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
  
  def create_user_with_oauth(user)
    create_user(
      email: user['email'],
      uid: user['id'],
      provider: 'facebook',
      expires_in: @expires_in.to_i,
      token: @access_token
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
