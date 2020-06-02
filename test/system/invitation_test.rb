require "application_system_test_case"

class InvitationTest < ApplicationSystemTestCase
  setup do
    @islander = islanders(:one)
  end

  test "desiring to extend an invitation" do
    visit "/invite"
    # you have to authenticate
    log_in(@islander)
    # now see the invitation page
    assert_text "Send this to your friends!"
  end
end
