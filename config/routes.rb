Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "application#home"

  namespace :api do
    namespace :v1 do

      resource :users, only: [:index, :create]
      post "/login", to: "auth#login"
      get "/auto_login", to: "auth#auto_login"
      get "/user_is_authorized", to: "auth#user_is_authorized"
      
    end
  end

end
