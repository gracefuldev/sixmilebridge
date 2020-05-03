Rails.application.routes.draw do
  # public interfaces
  root "home#index"
  get "/herewego", to: "acceptances#new"

  # Logged-in islander (user) interfaces
  # this doesn't do anything yet so it's public too right now
  get "/invite", to: "invitations#new"

  # Operator interfaces (like for us)
  scope :operator do
    # removing until we can secure it
    # resources :islanders
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
