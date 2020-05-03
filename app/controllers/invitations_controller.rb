class InvitationsController < ApplicationController
  def new
    inviter = Islander.for_email("avdi@avdi.codes") # IRL this will come out of the session. For now There Is Only One
    invitation_link = InvitationLink.for(inviter_id: inviter.id, day: Date.now, description: "the only one")
    @subject = "Want to catch up sometime ... random?"
    @body = <<~EOM
      I want to catch up with you (and other people) 
      and I made an app for this! Other charming text here.

      See, the hard part is scheduling. So this app will do some random scheduling of times to meet.
      If you're available at the same time as me, it'll randomly sometimes suggest we meet up.

      Click here to accept: #{invitation_link.url}

    EOM
  end
end
