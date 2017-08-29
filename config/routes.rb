Rails.application.routes.draw do
  root to: redirect('/warning')
  
  get '/warning', to: 'warning#index'
  get 'home', to: 'home#index'
  
  namespace :db do
    resources :albums
  end
end
