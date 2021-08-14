Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:create]
  post '/login', to: 'authentication#authenticate'
  resources :favourites, only: [:index, :create, :destroy]
end
