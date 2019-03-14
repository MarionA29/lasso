Rails.application.routes.draw do
  root 'assos#index'
  devise_for :users
  resources :assos
  resources :users, only: [:show, :edit, :update, :destroy]
end
