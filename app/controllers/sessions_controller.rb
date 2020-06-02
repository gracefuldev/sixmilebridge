class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create unless Rails.env.production?

  def create
    @islander = Islander.find_or_create_from_auth_hash(auth_hash)
    self.current_islander = @islander
    redirect_to "/"
  end

  protected

  def auth_hash
    request.env["omniauth.auth"]
  end
end
