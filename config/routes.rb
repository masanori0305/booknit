Rails.application.routes.draw do
 devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'books#index'
  get 'books/search' => 'books#search'
  resources :books do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end
