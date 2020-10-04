require "application_system_test_case"

class InvitationTest < ApplicationSystemTestCase
  setup do
    @islander = islanders(:one) # TODO: Avdi, please tell me how this works again - Jess
  end

  test "desiring to extend an invitation" do
    visit "/invite"
    # you have to authenticate
    log_in(@islander)
    # now see the invitation page
    assert_text "Send this to your friends!"
  end

  test "get to invitation page from home page" do
    visit "/"
    click_on "Log in"
    log_in(@islander)
    click_on "Invite people to catch up"
    assert_equal "/invite", current_path
  end
end
