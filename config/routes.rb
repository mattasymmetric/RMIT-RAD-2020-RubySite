Rails.application.routes.draw do
  # Static views
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  # User Views
end
