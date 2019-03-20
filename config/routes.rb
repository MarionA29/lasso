Rails.application.routes.draw do

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  root 'assos#index'
  devise_for :users
  resources :assos
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :subscriptions
  resources :teams, only: [:index]



  resources :privates_messages, except: [:show]
  resources :assos do
  resources :privates_messages, only: [:show, :new, :create]
end

  namespace :admin do
    root to: 'dashboard#index'
    resources :validation
    resources :users
    resources :assos
    resources :admin
  end
end
