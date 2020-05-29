Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  # Static views
  get '/home',      to: 'static_pages#home'
  # User Views
  get '/signup',    to: 'users#new'
  post '/signup',   to: 'users#create'
  # Sessions Views
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # Model Resources
  resources :users
end
