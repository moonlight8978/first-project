class AuthController < ApplicationController
  def create
    auth =  request.env['omniauth.auth']
    token = Digest::SHA256.hexdigest(auth.credentials.token)
    client_url = "//localhost:8080/#/social_login/#{auth.provider}?uid=#{auth.uid}&token=#{token}"

    redirect_to client_url
  end

  def code
    begin
      response = GoogleAuth.new.authorize(params[:code])
      puts response.to_yaml
    rescue Signet::AuthorizationError
      p 'Unauthorized'
    end
    
    # puts JsonWebToken.decode(user['id_token'], false).to_yaml
  end

  def facebook
    FacebookAuth.new(params[:access_token]).authorize
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end
end
