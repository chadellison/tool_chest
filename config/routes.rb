Rails.application.routes.draw do
  resources :tools, only: [:new, :create, :show, :edit, :update, :destroy]

  namespace :admin do
    resources :tools, only: [:index, :show]
  end

  resources :categories, only: [:new, :create, :show, :destroy, :edit, :update]

  namespace :admin do
    resources :categories, only: [:index, :new, :create]
  end

  resources :users, only: [:index, :new, :create, :show] do
    resources :tools
  end
  root to: 'users#index'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
end
