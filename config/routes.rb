Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'restaurants#index'
  get "/restaurants", to: "restaurants#index"
  get 'restaurants/:id', to: "restaurants#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
