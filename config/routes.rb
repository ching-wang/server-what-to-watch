Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      post "/login", to: "users#login"
      post "/validate", to: "users#validate"
    end
  end
end
