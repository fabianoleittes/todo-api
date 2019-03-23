Rails.application.routes.draw do
  resources :todos, only: %i[show index update create destroy]

  post 'auth/login', to: 'auth#authenticate'
  post 'signup', to: 'users#create'
end
