Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:create]
  resources :authentication, only: [:create]
  resources :favourites, only: [:index, :create, :destroy]
end
