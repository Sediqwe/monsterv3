Rails.application.routes.draw do
  root 'games#index'
  get "registration", to: "login#registration"
  get "login", to: "login#login"
  get "logout", to: "login#signout"
  post "sessions_create", to: "sessions#create"
  post "login_create", to: "login#create"
end
