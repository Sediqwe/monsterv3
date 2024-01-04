Rails.application.routes.draw do
  root "games#index"
  get "registration", to: "login#registration"
  get "login", to: "login#login"
  get "logout", to: "login#signout"
  post "sessions_create", to: "sessions#create"
  post "login_create", to: "login#create"
  get "settings", to: "users#settings"
  get "supportlists", to: "supportlists#index"
  patch "settings", to: "users#update"
  get "picturesdeletesettings", to: "users#picturesdeletesettings"
  resources :games
end
