Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :games do
    member do
      get :invite
    end
    resources :players, only: %i[new create ]
  end

  resource :profiles, only: %i[show edit]

  resources :players, only: %i[destroy] do
    collection do
      get :pending
    end
    member do
      patch :accept
    end
  end

  resources :games, only: %i[edit update]

  # delete "players/:id", to: "players#destroy", as: "players_destroy"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
