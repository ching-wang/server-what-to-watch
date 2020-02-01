Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update]
      post "/login", to: "users#login"
      post "/validate", to: "users#validate"
      get "/search", to: "search#index"
    end
  end
end
