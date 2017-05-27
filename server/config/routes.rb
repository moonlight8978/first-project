Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    scope module: :security do
      scope module: :auth do
        post 'login'
        post 'logout'
        post 'register'
        get  'register/:token', action: :register_confirm
        get  'test'
      end

      namespace :account do
        put   'password', action: :change_password
      end

      scope module: :reset_password do
        post  'reset-password',        action: :send_token
        get   'reset-password/:token', action: :reset_password
      end
    end

    namespace :schedule do
      resource :token, only: :destroy
    end

    scope module: :entity do
      resources :users, only: [:index]
      resources :products
    end

    scope module: :vndb do
      resources :games, shallow: true do
        resources :characters
      end
      resources :companies
    end
  end
end
