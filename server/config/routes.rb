Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users', to: 'users#index'

  post 'login', to: 'auth#login'

  post 'register', to: 'auth#register'
  
  resource :user, only: [:index, :show]
end
