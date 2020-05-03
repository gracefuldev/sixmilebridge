module InvitationsHelper
  def invitation_mailto_link
    "mailto:?subject=#{@subject}&body=#{@body}"
  end
end
