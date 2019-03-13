Rails.application.routes.draw do
  root 'asso#index'
  devise_for :users
  resources :assos
end
