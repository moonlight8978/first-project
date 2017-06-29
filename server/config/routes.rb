Rails.application.routes.draw do
  namespace :api do
    scope module: :v1 do
      namespace :db do
        resources :novels, id: /[0-9\.]?/ do
          resources :screenshots, except: :show, controller: 'novels/screenshots'
          resources :staffs,      except: :show, controller: 'novels/staffs'

          get    'tags',     to: 'novels/tags#index_novel'
          delete 'tags/:id', to: 'novels/tags#destroy_novel'
          put    'tags/:id', to: 'novels/tags#update_novel'

          # get    'staffs',     to: 'novels/people#index_novel'
          # delete 'staffs/:id', to: 'novels/people#destroy_novel'
          # put    'staffs/:id', to: 'novels/people#update_novel'
          # post   'staffs/:id', to:

          get    'characters',     to: 'novels/characters#index_novel'
          put    'characters/:id', to: 'novels/characters#update_novel'
          post   'characters',     to: 'novels/characters#create_novel'
          delete 'characters/:id', to: 'novels/characters#destroy_novel'
          resources :characters, only: [:destroy, :create] do
            resources :voice_actresses, except: :show,
              controller: 'novels/characters/people'
          end

          get 'releases', to: 'novels/releases#index_novel'
          put 'releases', to: 'novels/releases#update_novel'
          resources :releases, only: [:destroy, :create] do
            resources :producers, except: [:show, :create],
              controller: 'novels/releases/producers'

            # get    'platforms',     to: 'novels/releases/platforms#index_release'
            # put    'platforms/:id', to: 'novels/releases/platforms#update_release'
            # delete 'platforms/:id', to: 'novels/releases/platforms#destroy_release'
          end
        end

        namespace :novels do
          resources :tags
          resources :characters, except: [:create, :destroy]
          resources :releases,   except: [:create, :destroy]
          resources :platforms, controller: 'releases/platforms'
        end
      end

      namespace :search do
        get 'novels',     to: 'novels#index'
        get 'characters', to: 'characters#index'
        get 'releases',   to: 'releases#index'
        get 'tags',       to: 'tags#index'
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
