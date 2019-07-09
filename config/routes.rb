Rails.application.routes.draw do
  resources :cards
  resources :users
  root 'users#index'
  resources :orders
  resources :drinks
  resources :foods
  get "/foods/:id/add", to: "foods#add_food", as: "add_food"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
