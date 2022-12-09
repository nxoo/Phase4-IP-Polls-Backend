Rails.application.routes.draw do
  post "/login", to: "sessions#login"
  post "/signup", to: "sessions#signup"

  # resources :todos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
