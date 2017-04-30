Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :eroges

  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end