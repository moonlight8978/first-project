class Api::Schedule::TokensController < ApplicationController
  before_action :require_admin

  def destroy # destroy_token
    Security::InvalidToken.expired.destroy_all
    head :no_content
  end
end
