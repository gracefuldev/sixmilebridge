module InvitationsHelper
  def invitation_mailto_link(interior)
    mail_to("", interior, subject: @subject, body: @body, )
  end
end
