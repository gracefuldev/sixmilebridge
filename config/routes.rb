Rails.application.routes.draw do
  # public interfaces
  root "home#index"
  get "/herewego", to: "acceptances#new"

  # Logged-in islander (user) interfaces
  get "/invite", to: "invitations#new"

  # Operator interfaces
  resources :islanders

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
