Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :show] do
    resources :tools
  end
  root to: 'users#index'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
end
