Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  get "/map", to: "pages#map"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/rating", to: "ratings#show"

  get '/vote', to: 'votes#vote'

  resources :matches do
    resources :user_teams, only: [:create, :new]
  end

  resources :profil, only: [:show, :edit, :update, :destroy]



  # Defines the root path route ("/")
  # root "posts#index"
end
