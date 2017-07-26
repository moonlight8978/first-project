class SessionService::Login < ApplicationService
  attr_accessor :user

  def initialize(params)
    @params = params
    @user = Security::User
      .includes(:roles, :country)
      .find_by("user_name = :login or email = :login", { login: @params[:login] })
    super()
  end

  def perform
    account_exist? &&
    password_correct? &&
    account_activated?

    self
  end

  def token
    @user.token
  end

private

  def account_exist?
    return true if @user.present?
    @errors.add!(account: 'Account does not exist!')
    false
  end

  def password_correct?
    return true if @user.authenticate(@params[:password])
    @errors.add!(password: 'Password is incorrect!')
    false
  end

  def account_activated?
    return true if @user.activated
    @errors.add!(activated: 'Account have not activated yet!')
    false
  end
end
