class SessionService::Login
  attr_accessor :user

  def initialize(params)
    @params = params
    @user = Security::User.find_by(
      "user_name = :login or email = :login", { login: @params[:login] }
    )
  end

  def perform
    @user.present? &&
    @user.authenticate(@params[:password]) &&
    @user.activated
  end

  def account_not_activated?
    @user.present? &&
    @user.authenticate(@params[:password]) &&
    !@user.activated
  end

  def token
    @user.token
  end
end
