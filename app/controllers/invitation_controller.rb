class InvitationController < ApplicationController
  def desired
    unless acting_islander
      redirect_to "/auth/developer"
      return
    end
    inviter = Islander.get_it_from_the_session # break when you get here, so we can make it work right
    invitation_link = InvitationLink.for(inviter_id: inviter.id, day: Date.new, description: "the only one")
    @subject = "Want to catch up sometime ... random?"
    @body = <<~EOM
      I want to catch up with you (and other people) 
      and I made an app for this! Other charming text here.

      See, the hard part is scheduling. So this app will do some random scheduling of times to meet.
      If you're available at the same time as me, it'll randomly sometimes suggest we meet up.

      Click here to accept: #{invitation_link.url}

    EOM
  end

  def opened
    @invitation_id = params[:invitation_id]
    if @invitation_id.blank?
      render :missing_invitation_id
    end
  end
end
