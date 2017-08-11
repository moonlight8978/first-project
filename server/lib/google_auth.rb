require 'google/api_client/client_secrets'
require 'uri'

module GoogleAuth
  def self.authorize(code)
    self.init
    @auth_client.code = code
    @auth_client.fetch_access_token!
  end
  
private

  def self.init
    client_secrets = Google::APIClient::ClientSecrets.load('client_secret.json')
    @auth_client = client_secrets.to_authorization
    @auth_client.update!(
      :scope => 'profile',
      :redirect_uri => 'postmessage')
  end
end
