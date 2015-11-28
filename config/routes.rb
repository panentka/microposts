Rails.application.routes.draw do
  get 'users/edit'

  get 'users/edit'

  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  resources :users do
    member do
      get :following_users
    end
  end
  resources :users do
    member do
      get :follower_users
    end
  end
end
