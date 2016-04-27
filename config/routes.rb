Rails.application.routes.draw do
  root to: 'home#show'
  get '/auth/facebook', as: :facebook_login
  get '/auth/facebook/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  post '/mygarden', to: "gardens#create", as: :gardens
  get '/mygarden', to: "gardens#show", as: :garden

  resources :plants, only: [:index, :show, :create]
  resources :recipes, only: [:index, :show]


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :plants, only: [:index, :show]
    end
  end
end
