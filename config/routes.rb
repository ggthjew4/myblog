Rails.application.routes.draw do
  devise_for :users
  resources :articles
  root to: 'pages#index'
  get '/about', to: 'pages#about'
end
