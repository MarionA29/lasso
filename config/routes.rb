Rails.application.routes.draw do
  root 'assos#index'
  devise_for :users
  resources :assos

  namespace :admin do
    root 'admin/assos/#index'
    resources :validation
    resources :users
    resources :assos
  end
end
