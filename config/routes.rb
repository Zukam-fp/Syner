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
  resources :teams, only: [] do
    resources :ratings, only: [:new]
  end
  resources :user_teams, only: [] do
    resources :ratings, only: [:create]
  end
  resources :matches do
    resources :user_teams, only: [:create, :new, :update]
  end

  resources :profil, only: [:show, :edit, :update, :destroy]



  get "/dashboard", to: "profil#dashboard"



  # Defines the root path route ("/")
  # root "posts#index"
end
