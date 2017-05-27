module ResetPasswordService
  class Resetting
    def initialize(params)
      @token = params[:token]
      @params = params.slice(:password)
      @user = ResetPasswordToken.eager_load(:user).find_by_token(@token)
    end

    def reset?
      token = ResetPasswordToken.find_by_token(@token)
      if token.expiration < Time.zone.now
        false
      else
        update && token.destroy
        token.destroyed?
      end
    end

    private
      def update
        @params[:password_updated_at] = Time.zone.now
        @user.update(@params)
      end
  end

  class Generating
    attr_accessor :token
    EXPIRATION = 2.hours.from_now

    def initialize(params)
      @params = params
      @user = User.find_by(
        "user_name = :user_name and email = :email",
        { user_name: params[:user_name], email: params[:email] }
      )
    end

    def represent_user?
      @user.present? ? true : false
    end

    def generate_token?
      @token = SecureRandom.urlsafe_base64(128)
      service = ResetPasswordToken.new(
        user_id: @user.id,
        token: @token,
        expiration: EXPIRATION
      )
      service.save
    end
  end
end
