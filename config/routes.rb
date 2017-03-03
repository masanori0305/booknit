Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: "users/sessions",
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'books#index'
  get 'books/search' => 'books#search'
  get 'books/search_ajax' => 'books#search_ajax'
  resources :books do
    resources :comments, only: [:create]
  end
  resources :users
end
