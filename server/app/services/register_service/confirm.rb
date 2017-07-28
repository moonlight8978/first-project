class RegisterService::Confirm < ApplicationService
  def initialize(email, token)
    @token = token
    @user = Security::User.includes(:activate_account_tokens)
      .find_by_email(email)
    @role = Security::User::Role.find_by_role('ROLE_USER')
    super()
  end

  def perform
    unless @user
      user_not_exist
      return self
    end

    activate_user || failed_to_activate

    self
  end

private

  def user_not_exist
    @errors.add!(not_exist: 'メールアドレスの存在がありません。')
    @errors.set_status(:not_found)
  end

  def activate_user
    try = 1
    success = false

    ActiveRecord::Base.transaction do
      begin
        @user.update(activated: true)
        @user.activate_account_tokens.destroy_all
        @user.roles << @role
        success = true
      rescue ActiveRecord::Rollback
        try += 1
        retry if try < 3
      end
    end

    success
  end

  def failed_to_activate
    @errors.add!(message: 'Something went wrong. Please try again!')
    @errors.set_status(:bad_request)
  end
end
