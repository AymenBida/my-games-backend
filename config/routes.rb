Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :create, :update, :destroy]
  post '/signup', to: 'users#create'
  post '/login', to: 'authentication#authenticate'
end
