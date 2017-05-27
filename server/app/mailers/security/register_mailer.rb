class Security::RegisterMailer < ApplicationMailer
  default from: 'moonlight8978@gmail.com'
  URL = 'http://localhost:3000'

  def complete_register(user)
    @user = user
    @confirm_url = confirm_url(@user.activate_account_token)
    @login_url = 'http://localhost:8080/login'
    mail(to: @user.email, subject: 'Welcome!')
  end

  private
    def confirm_url(token)
      "#{URL}/api/register/#{token}"
    end
end
