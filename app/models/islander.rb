class Islander < ApplicationRecord
  def self.for_email(email)
    find_by!(email: email)
  end
end
