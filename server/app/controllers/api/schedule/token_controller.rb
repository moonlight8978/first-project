class Api::Schedule::TokenController < ApplicationController
  before_action :require_admin
  
  def destroy # destroy_token
    expired_token = InvalidToken
      .where("expiration <= :expiration", { expiration: Time.zone.now })
      .pluck(:id)
    InvalidToken.delete(expired_token)
    head :no_content
  end
end
