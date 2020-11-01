require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest

  setup do
    OmniAuth.config.test_mode = true
  end

  test "admin gives civilian a 404" do
    get admin_url
    assert_response :missing 
  end

  test "Avdi can see the admin page" do
    log_in_as(:avdi)
    session[:islander_id] = islanders(:avdi).id
    get admin_url
    assert_response :success 
  end

  def log_in_as(islander_symbol)
    OmniAuth.config.mock_auth[:developer] = OmniAuth::AuthHash.new({provider: "developer", info: { email: islanders(islander_symbol).email }})
    post "/auth/developer"
    follow_redirect!
  ensure
    OmniAuth.config.mock_auth[:developer] = nil
  end

end