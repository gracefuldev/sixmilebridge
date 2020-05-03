class AcceptancesController < ApplicationController
  def new
    @invitation_id = params[:invitation_id]
    if @invitation_id.blank?
      render :missing_invitation_id
    end
  end
end
