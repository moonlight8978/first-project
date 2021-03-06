Rails.application.routes.draw do
  namespace :api do
    scope module: :v1, constraints: ApiConstraint.new(1) do
      namespace :db do
        resources :novels do
          resources :screenshots,  shallow: true, controller: 'novels/screenshots'
          resources :staffs,       only: :create, controller: 'novels/staffs'
          scope module: :novels do
            get  'ratings/:user_id', to: 'ratings#show'
            post 'ratings', to: 'ratings#create'
            get  'ratings', to: 'ratings#index'
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

        resources :character_novels, only: [] do
          # Add more seiyuu to character
          post   'voice_actresses', to: 'character_novels/voice_actresses#create'
          # Update seiyuu alias
          patch  'voice_actresses/:id', to: 'character_novels/voice_actresses#update'
          put    'voice_actresses/:id', to: 'character_novels/voice_actresses#update'
          # Remove seiyuu from character
          delete 'voice_actresses/:id', to: 'character_novels/voice_actresses#destroy'
        end

        scope module: :novels do
          resources :novel_releases, only: [:update, :show, :index], controller: 'releases'
          resources :novel_staffs,   only: [:update, :destroy], controller: 'staffs'
          resources :characters,     except: :destroy
          resources :novel_tags,     except: :destroy,          controller: 'tags' do
            # Get all novels belongs to a specific tag
            get 'novels'
          end
          scope module: :releases do
            resources :novel_platforms, except: :show, controller: 'platforms'
          end
        end

        resources :producers, controller: 'companies'

        resources :people do
          scope module: :people do
            resources :staffs, only: :index
            resources :voice_actresses, only: :index
            resources :comments, except: :show
          end
        end
      end

      namespace :search do
        get 'novels',     to: 'novels#index'
        get 'characters', to: 'characters#index'
        get 'releases',   to: 'releases#index'
        get 'novel_tags', to: 'tags#index'
        get 'people',     to: 'people#index'
      end

      resources :countries, except: :show

      scope module: :security do
        scope module: :auth do
          post 'login'
          post 'login/:provider', action: :social_login
          post 'logout'
          post 'register'
          post 'register/confirm', action: 'register_confirm'
        end
      end
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
