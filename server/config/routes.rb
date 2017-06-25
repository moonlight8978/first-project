Rails.application.routes.draw do
  namespace :api do
    scope module: :v1 do
      scope module: :db do
        resources :novels do
          resources :characters,   except: :index, shallow: true
          resources :releases,     only: :create
          resources :screenshots,  except: [:show, :update]
          get    'tags',       to: 'tags#index_novel'
          post   'tags',       to: 'tags#create_novel'
          delete 'tags/:id',   to: 'tags#destroy_novel'
          get    'staffs',     to: 'staffs#index_novel'
          post   'staffs',     to: 'staffs#create_novel'
          delete 'staffs/:id', to: 'staffs#destroy_novel'
          get    'characters', to: 'characters#index_novel'
          get    'releases',   to: 'releases#index_novel'
        end

        resources :companies do
          get 'novels', to: 'novels#index_company'
        end

        resources :people do
          get 'voiceds', to: 'characters#index_person'
          get 'credits', to: 'staffs#index_person'
          # get 'graph', to: 'graph/people#show'
        end

        resources :releases, except: :create do
          get 'publishers', controller: '/api/v1/vndb/companies', action: :index_published
          get 'developers', to: 'companies#index_developed'
        end

        resources :characters, only: :index
        resources :tags

        namespace :search do
          get 'novels'
        end
      end
    end

    scope module: :database do
      resources :people
      resources :companies
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
