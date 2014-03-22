Eye::Application.routes.draw do
  resources :images
  devise_for :users
  root to: 'application#index'
end
