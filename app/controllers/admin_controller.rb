class AdminController < ApplicationController
  def index
    return render_not_found if acting_islander.nil?
    return render_not_found unless admin?(acting_islander)
  end

  def admin?(islander)
    ["avdi@avdi.codes", "jessitron@jessitron.com"].include? islander.email
  end

end
