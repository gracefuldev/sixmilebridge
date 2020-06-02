require "application_system_test_case"

class SessionTest < ApplicationSystemTestCase
  setup do
    @islander = islanders(:one)
  end

  test "log in from the home page" do
    visit "/"
    assert_selector "h1", text: "Catch Up To Me !"
    click_on "Log In"
    # you can authenticate
    log_in(@islander)
    # now see your name on the page
    assert_text @islander.email
  end
end
