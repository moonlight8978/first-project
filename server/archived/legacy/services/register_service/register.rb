class RegisterService::Register
  attr_accessor :user, :params, :token


  def initialize(params)
    @params = params
    @user = Security::User.new(@params)
  end

  def perform
    return false unless @user.save
    generate_token_svc = RegisterService::GenerateToken.new(@user)
    @generate_token_svc.perform
  end

  def user_already_exist?
    @users = Security::User.where(
      "user_name = :user_name or email = :email",
      { user_name: @params[:user_name], email: @params[:email] }
    )
    @users.empty? ? false : true
  end
end
