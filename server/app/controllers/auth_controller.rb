class AuthController < ApplicationController
  def login
    if params.fetch(:user_name, {}).present?
      @user = User.find_by_user_name(params[:user_name])
    elsif params.fetch(:email, {}).present?
      @user = User.find_by_email(params[:email])
    else
      return head :unauthorized
    end
    
    if @user && @user.authenticate(params[:password])
      token = JsonWebToken.encode(id: @user.id)
      render json: { token: token }, status: :ok
    else
      head :unauthorized
    end
  end

  def register
    @users = User.where(
      "user_name = :user_name or email = :email",
      { user_name: params[:user_name], 
        email: params[:email] }
    )

    if @users.empty?
      @user = User.new(register_params)
      puts @user.inspect
      head :no_content
    else
      head :conflict
    end
  end

private
  def register_params
    params.require(:auth).permit(:email, :user_name, :password)
  end
end
