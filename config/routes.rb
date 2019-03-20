Rails.application.routes.draw do
  root 'assos#index'
  devise_for :users
  resources :assos
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :subscriptions
  resources :teams, only: [:index]



  resources :privates_messages, except: [:show]
  resources :assos do
  resources :privates_messages, only: [:new, :index] do
  resources :privates_messages, only: [:show, :create]
  end
end

  namespace :admin do
    root to: 'dashboard#index'
    resources :validation
    resources :users
    resources :assos
    resources :admin
  end
end
