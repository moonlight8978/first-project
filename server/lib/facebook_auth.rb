require 'http'
require 'uri'
require 'json'

class FacebookAuth
  def initialize(access_token)
    @uri = URI.parse(auth_url(access_token))
    @success
  end

  def authorize
    @response = HTTP.get(@uri)
    @response.status == 200 && success
    @success && @user
  end

private

  def success
    @success = true
    @user = JSON.parse(@response.body)
  end

  def auth_url(access_token)
    "https://graph.facebook.com/me?fields=id,email&access_token=#{access_token}"
  end
end
