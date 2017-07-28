class RegisterService::Register < ApplicationService
  attr_accessor :user, :params, :token

  def initialize(params)
    @params = params
    super()
  end

  def perform
    @user = ::Security::User.create(@params)

    if @user.errors.any?
      errors_occurred(@user.errors)
    else
      @token = RegisterService::GenerateToken.new(@user).perform
    end

    self
  end

private

  def user_already_exist?

  end
end
