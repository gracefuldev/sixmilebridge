Rails.application.routes.draw do
  # public interfaces
  root "home#index"
  get "/herewego", to: "invitation#opened"

  # authinate
  # it said to make this a get ... but for developer it needs to be a post. what is it for others?
  match "/auth/:provider/callback", to: "sessions#create", via: [:post, :get]

  get "/logout", to: "sessions#delete"

  # Logged-in islander (user) interfaces
  # this doesn't do anything yet so it's public too right now
  get "/invite", to: "invitation#desired"

  get "/admin", to: "admin#index"

  # Operator interfaces (like for us)
  # In prod this needs to be behind auth
  unless Rails.env.production?
    scope :operator do
      resources :islanders
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
