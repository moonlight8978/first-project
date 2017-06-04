class RegisterService::Confirm
  def initialize(token)
    @token = token
    @user = Security::ActivateAccountToken.eager_load(:user)
      .find_by_token(token)
      .user
  end

  def perform
    return false unless represent_user?
    @user.activated = true
    @user.activate_account_tokens.destroy_all
    role_user = Security::Role.find_by(role: 'ROLE_USER')
    @user.roles << role_user
    @user.save
  end

  def represent_user?
    @user.present?
  end
end
