class SessionService::Login
  attr_accessor :user

  def initialize(params)
    @params = params
    @user = Security::User.find_by(
      "user_name = :login or email = :login", { login: @params[:login] }
    )
  end

  def login?
    @user.present? &&
    @user.activated &&
    @user.authenticate(@params[:password])
  end
end
