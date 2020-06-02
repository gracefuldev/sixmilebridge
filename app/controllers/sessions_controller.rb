class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    Honeycomb.start_span(name: "login") do |span|
      Honeycomb.add_field("auth.provider", auth_provider)
      @islander = Islander.find_by(email: authorized_email)
      if (@islander)
        Honeycomb.add_field_to_trace("islander_id", @islander.id)
        Honeycomb.add_field("result", "success")
        self.acting_islander = @islander
        redirect_to desired_path
      else
        Honeycomb.add_field("rejected_email", authorized_email)
        Honeycomb.add_field("result", "failure")
        Honeycomb.add_field("notice", "rejected new islander")
        redirect_to "/no-new-accounts"
      end
    end
  end

  def delete
    self.clear_acting_islander
    redirect_to "/"
  end

  protected

  def authorized_email
    request.env.dig("omniauth.auth", :info, :email)
  end

  def auth_provider
    request.env.dig("omniauth.auth", :provider)
  end

  def desired_path
    request.env["omniauth.origin"] or "/"
  end
end
