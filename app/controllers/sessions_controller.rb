class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @islander = Islander.find_by(email: authorized_email)
    unless @islander
      Honeycomb.add_field("notice", "rejected new islander")
      redirect_to helpers.auth_url(desired_path: desired_path)
      return
    end
    Honeycomb.add_field("islander_id", @islander.id)
    self.acting_islander = @islander
    redirect_to desired_path
  end

  def delete
    self.clear_acting_islander
    redirect_to "/"
  end

  protected

  def authorized_email
    request.env.dig("omniauth.auth", :info, :email) # well, it works for "developer"
  end

  def desired_path
    request.env["omniauth.origin"] or "/"
  end
end
