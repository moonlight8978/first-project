Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    scope module: :entity do
      resources :users, only: [:index]
    end

    scope module: :security do
      scope module: :auth do
        post 'login'
        post 'logout'
        post 'register'
      end

      namespace :account do
        put   'password',        action: :change_password
        post  'password',        action: :send_token
        put   'password/:token', action: :reset_password
      end
    end

    namespace :schedule do
      resource :token, only: :destroy
    end
  end
end
