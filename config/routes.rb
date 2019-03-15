Rails.application.routes.draw do
  root 'assos#index'
  devise_for :users
  resources :assos
  resources :subscriptions
end
