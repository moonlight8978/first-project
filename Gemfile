source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.3'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'bcrypt', '~> 3.1.7'

gem 'groupdate', '~> 3.2'
gem 'sidekiq', '~> 5.0'
gem 'sunspot_rails', '~> 2.2', '>= 2.2.7'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'kaminari', '~> 1.0', '>= 1.0.1'
gem 'devise', '~> 4.3'
gem 'active_model_serializers', '~> 0.10.6'
# gem 'redis', '~> 3.0'
gem 'omniauth', '~> 1.6', '>= 1.6.1'
gem 'omniauth-google-oauth2', '~> 0.5.2'
gem 'omniauth-facebook', '~> 4.0'
gem 'omniauth-twitter', '~> 1.4'
gem 'faraday', '~> 0.9.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'sunspot_solr', '~> 2.2', '>= 2.2.7'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet', '~> 5.6', '>= 5.6.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
