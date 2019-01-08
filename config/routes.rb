Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
        get '/plants/find', to: "plants#find_by"
      resources :plants, only: [:index, :show, :create, :update]
      resources :recipes, only: [:index]
      resources :frost_dates, only: [:index]
    end
  end
end
