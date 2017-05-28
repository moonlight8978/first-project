class RegisterService::Confirm
  def initialize(token)
    @token = token
    @user = Security::User.find_by_activate_account_token(token)
  end

  def activate?
    return false unless represent_user?
    @user.activated = true
    @user.activate_account_token = nil
    @user.save
  end

  def represent_user?
    @user.present?
  end
end
