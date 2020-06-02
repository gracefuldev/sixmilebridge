class ApplicationController < ActionController::Base
  def acting_islander
    id = session["islander_id"]
    Islander.find_by(id: id) # cache this
  end

  def acting_islander=(who)
    session["islander_id"] = who.id
  end
end
