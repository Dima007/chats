Rails.application.routes.draw do
  root 'dashboard#index'

  get     '/signup',    to: 'users#new'
  get     '/login',     to: 'sessions#new'
  delete  '/logout',    to: 'sessions#destroy'

  resources :sessions, only: [:create]

  resources :users, only: [:create, :show]

  resources :chats do
    resources :messages
  end
end
