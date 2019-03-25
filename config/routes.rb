Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  resources :articles
  root to: 'articles#index'
end
