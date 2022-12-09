Rails.application.routes.draw do
  post "/login", to: "sessions#login"
  post "/signup", to: "sessions#signup"
  resources :questions, only: [:create, :index, :show, :update, :destroy]
  resources :choices, only: [:create, :index, :show, :update, :destroy]

  # resources :todos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
