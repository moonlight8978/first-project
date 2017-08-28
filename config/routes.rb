Rails.application.routes.draw do
  root to: redirect('/warning')
  
  get '/warning', to: 'warning#index'
  get 'home', to: 'home#index'
end
