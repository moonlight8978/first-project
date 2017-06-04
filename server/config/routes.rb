Rails.application.routes.draw do
  # namespace :bussiness do
  #   resources :types
  # end
  # namespace :bussiness do
  #   resources :products
  # end
  # namespace :vndb do
  #   resources :people
  # end
  # namespace :vndb do
  #   resources :characters
  # end
  # namespace :vndb do
  #   resources :publishes
  # end
  # namespace :vndb do
  #   resources :companies
  # end
  # namespace :vndb do
  #   resources :novels
  # end
  # namespace :security do
  #   resources :reset_password_tokens
  # end
  # namespace :security do
  #   resources :activate_account_tokens
  # end
  # namespace :security do
  #   resources :invalid_tokens
  # end
  # namespace :security do
  #   resources :authorities
  # end
  # namespace :security do
  #   resources :users
  # end
  # namespace :security do
  #   resources :roles
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    scope module: :v1 do
      scope module: :vndb do
        resources :novels do
          member do
            get 'characters'
            get 'releases'
            get 'staffs'
          end
        end
        resources :companies
        resources :people
      end
    end

    scope module: :entity do
      resources :users, only: [:index]
      resources :products
    end
  end

  scope module: :security do
    scope module: :register do
      post 'register'
      get  'register/:token', action: :register_confirm
      get  'test'
    end

    scope module: :session do
      post 'login'
      post 'logout'
    end

    namespace :account do
      get '', action: :show
      put 'password', action: :change_password
    end

    scope module: :reset_password do
      post  'reset-password',        action: :send_token
      get   'reset-password/:token', action: :reset_password
    end
  end

  namespace :schedule do
    resource :token, only: :destroy
  end
end
