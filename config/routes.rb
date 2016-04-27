Rails.application.routes.draw do
  root to: 'home#show'
  get '/auth/facebook', as: :facebook_login
  get '/auth/facebook/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
  resources :plants, only: [:index, :show, :create]
  resources :recipes, only: [:index, :show]
  resources :users, only: [:show] do
    post '/garden', to: 'gardens#create', as: :garden
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :plants, only: [:index, :show]
    end
  end
end
