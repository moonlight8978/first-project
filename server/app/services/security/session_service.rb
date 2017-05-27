module SessionService
  class Login
    attr_accessor :user

    def initialize(params)
      @params = params
      @user = User.find_by(
        "user_name = :login or email = :login", { login: @params[:login] }
      )
    end

    def login?
      @user.present? &&
      @user.activated &&
      @user.authenticate(@params[:password])
    end
  end

  class Logout
    def initialize(token)
      @token = TokenService.new(token)
    end

    def logout?
      return false unless @token.decode_success?
      InvalidToken.new(token: @token.token, expiration: @token.expire_at)
        .save
    end
  end
end
