class UserService
  attr_accessor :user

  def initialize(user, params, current_user = nil)
    @user = user
    @params = params
    @current_user ||= @user
  end

  def current_user?
    @user == @current_user
  end

  def present?
    @user.present?
  end

  def update
    @user.update(@params)
  end

  def change_password
    return false unless current_user?
    @params[:password_updated_at] = Time.zone.now
    @user.update(@params)
  end
end
