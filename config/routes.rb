Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update, :destroy]
      resources :wish_lists, only: [:create, :update, :destroy, :show]
      resources :wish_list_items, only: [:create, :destroy]
      get "/movies/:imdb_id", to: "movies#show"
      post "/login", to: "users#login"
      post "/validate", to: "users#validate"
      get "/search", to: "search#index"
    end
  end
end
