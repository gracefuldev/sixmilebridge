class AdminController < ApplicationController
  def index
    return render_not_found if acting_islander.nil?
    render plain: "Yay, you found me"
  end

end
