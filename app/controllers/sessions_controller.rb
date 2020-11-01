class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    trace_login_attempt do
      p request.env
      @islander = Islander.find_by(email: authorized_email)
      if (@islander)
        trace_login_success
        self.acting_islander = @islander
        redirect_to desired_path
      else
        trace_login_failure
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

  def trace_login_attempt
    Honeycomb.start_span(name: "login") do |span|
      Honeycomb.add_field("auth.provider", auth_provider)
      yield
    end
  end

  def trace_login_success
    Honeycomb.add_field_to_trace("islander_id", @islander.id)
    Honeycomb.add_field("result", "success")
  end

  def trace_login_failure
    Honeycomb.add_field("rejected_email", authorized_email)
    Honeycomb.add_field("result", "failure")
    Honeycomb.add_field("notice", "rejected new islander")
  end
end
