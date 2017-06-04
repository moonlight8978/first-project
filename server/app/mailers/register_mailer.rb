class RegisterMailer < ApplicationMailer
  default from: 'moonlight8978@gmail.com'
  URL = 'http://localhost:3000'

  def complete_register(user, token)
    @user = user
    @confirm_url = confirm_url(token)
    @login_url = 'http://localhost:8080/login'
    mail(to: @user.email, subject: 'Welcome!')
  end

  private
    def confirm_url(token)
      "#{URL}/register/#{token}"
    end
end
