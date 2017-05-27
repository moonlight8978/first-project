class RegisterService
  attr_accessor :user, :params

  def initialize(params)
    @params = params
    @user = User.new(@params)
  end

  def register?
    @user.activate_account_token = SecureRandom.urlsafe_base64(128)
    @user.save
  end

  def user_already_exist?
    @users = User.where(
      "user_name = :user_name or email = :email",
      { user_name: @params[:user_name], email: @params[:email] }
    )
    @users.empty? ? false : true
  end
end
