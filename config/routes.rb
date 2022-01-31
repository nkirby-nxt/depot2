Rails.application.routes.draw do
  resources :carts
  devise_for :users
  namespace :admin do 
    resources :customers, :orders, :products
  end
  get 'store/index'
  root to: 'store#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
