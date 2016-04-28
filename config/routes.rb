Rails.application.routes.draw do
  root to: 'home#show'
  get '/auth/facebook', as: :facebook_login
  get '/auth/facebook/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  post '/mygarden', to: "gardens#create", as: :gardens
  get '/mygarden', to: "gardens#show", as: :garden
  delete '/mygarden', to: "gardens#destroy", as: :garden_plants

  resources :plants, only: [:index, :show, :create]
  resources :recipes, only: [:index, :show]

  get '/developers', to: "api_keys#show", as: :developer
  post '/developers', to: "api_keys#create", as: :developers


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :plants, only: [:index, :show]
    end
  end
end
