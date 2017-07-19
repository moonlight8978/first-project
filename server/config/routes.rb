Rails.application.routes.draw do
  namespace :api do
    scope module: :v1 do
      namespace :db do
        resources :novels do
          resources :screenshots,  shallow: true, controller: 'novels/screenshots'
          resources :staffs,       only: :create, controller: 'novels/staffs'
          resources :characters, only: [] do
            # Add more seiyuu to character
            post   'voice_actresses/:id', to: 'novels/characters/voice_actresses#create'
            # Update seiyuu alias
            patch  'voice_actresses/:id', to: 'novels/characters/voice_actresses#update'
            put    'voice_actresses/:id', to: 'novels/characters/voice_actresses#update'
            # Remove seiyuu from character
            delete 'voice_actresses/:id', to: 'novels/characters/voice_actresses#destroy'
          end

          post   'characters',     to: 'novels/characters#create'
          # Add existing character to novel
          post   'characters/:id', to: 'novels/characters#create_novel'
          # Remove a character from novel (if character was in another novel), else destroy
          delete 'characters/:id', to: 'novels/characters#destroy_novel'

          # Add a tag to novel
          post   'tags/:id', to: 'novels/tags#create_novel'
          # Remove a tag from novel
          delete 'tags/:id', to: 'novels/tags#destroy_novel'

          post   'releases',     to: 'novels/releases#create'
          # Add a release to novel
          post   'releases/:id', to: 'novels/releases#create_novel'
          # Remove a release from novel
          delete 'releases/:id', to: 'novels/releases#destroy_novel'
        end

        scope module: :novels do
          resources :novel_releases, only: [:update, :show],    controller: 'releases'
          resources :novel_tags,     except: :destroy,          controller: 'tags'
          resources :novel_staffs,   only: [:update, :destroy], controller: 'staffs'
          resources :characters, except: :destroy
          scope module: :releases do
            resources :novel_platforms, except: :show, controller: 'platforms'
          end
          # resources :voice_actresses, only: :update do
          #   # Add more seiyuu to character
          #   post   'people/:id', to: 'characters/voice_actresses#create'
          #   # Remove seiyuu from character
          #   delete 'people/:id', to: 'characters/voice_actresses#destroy'
          # end
        end

        resources :producers, controller: 'companies'

        resources :people do

        end
      end

      namespace :search do
        get 'novels',     to: 'novels#index'
        get 'characters', to: 'characters#index'
        get 'releases',   to: 'releases#index'
        get 'tags',       to: 'tags#index'
      end

      resources :countries, except: :show
    end
  end

  # scope module: :security do
  #   scope module: :register do
  #     post 'register'
  #     get  'register/:token', action: :register_confirm
  #     get  'test'
  #   end

  #   scope module: :session do
  #     post 'login'
  #     post 'logout'
  #   end

  #   namespace :account do
  #     get '', action: :show
  #     put 'password', action: :change_password
  #   end

  #   scope module: :reset_password do
  #     post  'reset-password',        action: :send_token
  #     get   'reset-password/:token', action: :reset_password
  #   end
  # end

  # namespace :schedule do
  #   resource :token, only: :destroy
  # end
end
