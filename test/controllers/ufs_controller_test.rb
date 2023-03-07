require "test_helper"

class UfsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uf = ufs(:one)
  end

  test "should get index" do
    get ufs_url
    assert_response :success
  end
end
