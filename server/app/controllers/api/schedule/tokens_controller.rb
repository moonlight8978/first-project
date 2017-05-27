class Api::Schedule::TokensController < ApplicationController
  before_action :require_admin

  def destroy # destroy_token
    InvalidToken.where("expiration <= ?", Time.zone.now)
      .destroy_all
    head :no_content
  end
end
