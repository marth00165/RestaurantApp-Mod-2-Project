Rails.application.routes.draw do
  root 'users#index'
  resources :drink_orders
  resources :food_orders
  resources :orders
  resources :drinks
  resources :foods
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :cards
  resources :users







  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
