require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get pages_register_url
    assert_response :success
  end

  test "should get login" do
    get pages_login_url
    assert_response :success
  end
end
