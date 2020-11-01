class ApplicationController < ActionController::Base
  helper_method :acting_islander

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
    redirect_to helpers.auth_url, *args
  end
  
  def render_not_found
    render :file => "#{Rails.root}/public/404.html", :status => 404
  end
end
