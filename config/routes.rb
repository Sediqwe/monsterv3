Rails.application.routes.draw do
  resources :gmessages
  resources :games
  resources :translaters
  resources :uploads
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
  get "upload_plus", to: "upload#upload_plus"
  get "upload_minus", to: "upload#upload_minus"
  get "upload_bad", to: "upload#upload_bad"
  get "upload_bot_reset", to: "upload#upload_bot_reset" 
end
