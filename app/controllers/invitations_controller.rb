class InvitationsController < ApplicationController
  def new
    @subject = "Want to catch up sometime ... random?"
    @body = <<~EOM
      I want to catch up with you (and other people) 
      and I made an app for this!
      
    EOM
  end
end
