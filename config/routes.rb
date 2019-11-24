Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show update destroy]

      namespace :auth do
        post "signup", to: "users#signup"
        post "login",  to: "users#login"
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
