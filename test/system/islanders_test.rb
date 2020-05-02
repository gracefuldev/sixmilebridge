require "application_system_test_case"

class IslandersTest < ApplicationSystemTestCase
  setup do
    @islander = islanders(:one)
  end

  test "visiting the index" do
    visit islanders_url
    assert_selector "h1", text: "Islanders"
  end

  test "creating a Islander" do
    visit islanders_url
    click_on "New Islander"

    fill_in "Email", with: @islander.email
    fill_in "Timezzone", with: @islander.timezzone
    click_on "Create Islander"

    assert_text "Islander was successfully created"
    click_on "Back"
  end

  test "updating a Islander" do
    visit islanders_url
    click_on "Edit", match: :first

    fill_in "Email", with: @islander.email
    fill_in "Timezzone", with: @islander.timezzone
    click_on "Update Islander"

    assert_text "Islander was successfully updated"
    click_on "Back"
  end

  test "destroying a Islander" do
    visit islanders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Islander was successfully destroyed"
  end
end
