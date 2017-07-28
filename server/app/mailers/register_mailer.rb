class RegisterMailer < ApplicationMailer
  default from: 'moonlight8978@gmail.com'

  URL = 'http://localhost:8080'

  def complete_register(user, token)
    @user = user
    @confirm_url = confirm_url(user.email, token)
    @login_url = 'http://localhost:8080/login'
    mail(to: @user.email, subject: 'ようこそ～!')
  end

  private
    def confirm_url(email, token)
      "#{URL}/#/register/confirm?email=#{email}&token=#{token}"
    end
end
