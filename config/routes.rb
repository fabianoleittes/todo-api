Rails.application.routes.draw do
  resources :todos

  post 'auth/login', to: 'auth#authenticate'
  post 'signup', to: 'users#create'
end
