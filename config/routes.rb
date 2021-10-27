Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'restaurants#index'
  # get "/restaurants", to: "restaurants#index"
  # get 'restaurants/:id', to: "restaurants#show"
  # get 'menus/:id', to: "menus#show"

  resources :restaurants, only: [:index, :show] do
    resources :menus, only: [:index, :show]
    # resources :carts, only: [:index, :show, :create]
  end
  post "restaurants/:restaurant_id/menus/:menu_id/carts", to: "carts#create", as: 'cart'
  get "restaurants/:restaurant_id/menus/:menu_id/carts/:cart_id/edit", to: "carts#edit"
  patch "restaurants/:restaurant_id/menus/:menu_id/carts/:cart_id", to: "carts#update"
  delete "restaurants/:restaurant_id/menus/:menu_id/carts/:cart_id", to: "carts#delete"
  get 'orders', to: "orders#index"
  post 'orders/create', to: "orders#create"
  get 'orders/show'
  get 'users/order', to: "users#order"
  get 'users/:id', to: "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
