require "api_version"

Rails.application.routes.draw do
  scope defaults: { format: :json }, path: "/", constraints: { subdomain: "api" } do
    namespace :v1, constraints: ApiVersion.new(version: "v1", default: true) do
      resources :todos, only: %i[show index update create destroy]
      post "auth/login", to: "auth#authenticate"
      post "signup",     to: "users#create"
    end
  end
end
