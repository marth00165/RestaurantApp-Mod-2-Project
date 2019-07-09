Rails.application.routes.draw do
  resources :cards
  resources :users
  root 'users#index'
  resources :drink_orders
  resources :food_orders
  resources :orders
  resources :drinks
  resources :foods

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
