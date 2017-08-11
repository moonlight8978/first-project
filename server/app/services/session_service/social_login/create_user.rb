module SessionService::SocialLogin::CreateUser
  def create_user(params = {})
    ActiveRecord::Base.transaction do
      begin
        @user = Security::User.new(
          email: params[:email],
          password: SecureRandom.hex(10),
          activated: true
        )
        @user.save(validate: false)
        @user.roles << Security::User::Role.find_by_role('ROLE_USER')
        @user.create_oauth(
          uid: params[:uid],
          token: params[:token],
          provider: params[:provider],
          expiration: (Time.zone.now.to_i + params[:expires_in])
        )
      rescue ActiveRecord::Rollback
        errors_occurred
      end
    end
    
    @user
  end
end
