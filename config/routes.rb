Rails.application.routes.draw do
  root to: 'plants#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  post '/mygarden', to: "gardens#create", as: :gardens
  get '/mygarden', to: "gardens#show", as: :garden
  delete '/mygarden', to: "gardens#destroy", as: :garden_plants

  resources :plants, only: [:index, :show, :create]
  resources :recipes, only: [:index, :show]

  get '/developers', to: "api_keys#show", as: :developer
  post '/developers', to: "api_keys#create", as: :developers


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
        get '/plants/find', to: "plants#find_by"
      resources :plants, only: [:index, :show, :create, :update]
      resources :recipes, only: [:index]
      resources :frost_dates, only: [:index]
    end
  end
end
