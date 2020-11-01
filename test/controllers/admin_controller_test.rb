require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest

  test "admin gives civilian a 404" do
    get admin_url
    assert_response :missing 
  end
end