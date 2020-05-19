Rails.application.routes.draw do
  get 'users/new'
  # Static views
  get '/home',    to: 'static_pages#home'
  get '/about',   to: 'static_pages#about'
  # User Views
  get '/signup',  to: 'users#new'
end
