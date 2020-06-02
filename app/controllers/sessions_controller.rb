class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create unless Rails.env.production?

  def create
    @islander = Islander.find_by(email: authorized_email)
    self.acting_islander = @islander
    redirect_to "/"
  end

  protected

  def authorized_email
    request.env.dig("omniauth.auth", :info, :email)  # well, it works for "developer"
  end
end
