class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  def not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end
end
