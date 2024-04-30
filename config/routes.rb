Rails.application.routes.draw do
  
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
    get 'useredit', to: 'devise/registrations#edit'
    
  end
  devise_for :user, controllers: {
        registrations: 'users/registrations'        
      }

  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
