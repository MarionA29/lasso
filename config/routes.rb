Rails.application.routes.draw do
  root 'assos#index'
  devise_for :users
  resources :assos
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :subscriptions


  resources :privates_messages, except: [:show]
  resources :assos do
  resources :privates_messages, only: [:show]
end

  namespace :admin do
    root to: 'dashboard#index'
    resources :validation
    resources :users
    resources :assos
    resources :admin
  end
end
