class ApplicationController < ActionController::Base
  def acting_islander
    id = session[:islander_id]
    Islander.find_by(id: id) # cache this
  end

  def acting_islander=(who)
    session[:islander_id] = who.id
  end

  def clear_acting_islander
    session.delete(:islander_id)
  end

  def redirect_to_auth(*args)
    redirect_to "/auth/developer?" + { origin: request.env["PATH_INFO"] }.to_query, *args
  end
end
