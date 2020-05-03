require "ostruct"

class InvitationLink
  def self.for(inviter_id:, day:, description: "")
    # return a stub for now
    OpenStruct.new(url: "https://catchupto.me/herewego?invitation_id=123")
  end
end
