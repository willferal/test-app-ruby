require "test_helper"

class MunicipiosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get municipios_url
    assert_response :success
  end
end
