Rails.application.routes.draw do
  resources :articles
  root to: 'pages#index'
  get '/about', to: 'pages#about'
end
