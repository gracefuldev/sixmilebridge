require 'test_helper'

class IslandersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @islander = islanders(:one)
  end

  test "should get index" do
    get islanders_url
    assert_response :success
  end

  test "should get new" do
    get new_islander_url
    assert_response :success
  end

  test "should create islander" do
    assert_difference('Islander.count') do
      post islanders_url, params: { islander: { email: @islander.email, timezone: @islander.timezone } }
    end

    assert_redirected_to islander_url(Islander.last)
  end

  test "should show islander" do
    get islander_url(@islander)
    assert_response :success
  end

  test "should get edit" do
    get edit_islander_url(@islander)
    assert_response :success
  end

  test "should update islander" do
    patch islander_url(@islander), params: { islander: { email: @islander.email, timezone: @islander.timezone } }
    assert_redirected_to islander_url(@islander)
  end

  test "should destroy islander" do
    assert_difference('Islander.count', -1) do
      delete islander_url(@islander)
    end

    assert_redirected_to islanders_url
  end
end
