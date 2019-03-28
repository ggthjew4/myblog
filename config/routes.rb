Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :articles do
    resources :comments
  end
  resources :comments, only: [:create, :index]
  root to: 'articles#index'
end
