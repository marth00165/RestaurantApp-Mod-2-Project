Rails.application.routes.draw do
  root 'users#index'
  resources :orders
  resources :drinks
  resources :foods
  get "/foods/:id/add", to: "foods#add_food", as: "add_food"
  get "/drinks/:id/add", to: "drinks#add_drink", as: "add_drink"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :cards
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
