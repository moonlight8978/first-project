require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NyoroNyoro
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # Time zone
    config.time_zone = 'Asia/Bangkok'
    config.active_record.default_timezone = :local

    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths << Rails.root.join('app/services/concerns')

    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.delivery_method = :smtp

    ActionMailer::Base.smtp_settings = {
      :address        => 'smtp.gmail.com',
      :domain         => 'mail.google.com',
      :port           => 587,
      :user_name      => ENV['GMAIL_ACCOUNT'],
      :password       => ENV['GMAIL_PASSWORD'],
      :authentication => :plain
      # :enable_starttls_auto => true
    }

    # for omniauth
    # config.session_store :disabled
    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies # Required for all session management
    config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
  end
end
