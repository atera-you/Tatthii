require 'test_helper'

class CentralControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get central_home_url
    assert_response :success
  end

  test "should get about" do
    get central_about_url
    assert_response :success
  end

  test "should get search" do
    get central_search_url
    assert_response :success
  end

end
