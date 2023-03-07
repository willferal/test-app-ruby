require "test_helper"

class OrigensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @origem = origens(:one)
  end

  test "should get index" do
    get origens_url
    assert_response :success
  end

  test "should get new" do
    get new_origem_url
    assert_response :success
  end

  test "should create origem" do
    assert_difference("Origem.count") do
      post origens_url, params: { origem: { descricao: @origem.descricao } }
    end

    assert_redirected_to origem_url(Origem.last)
  end

  test "should show origem" do
    get origem_url(@origem)
    assert_response :success
  end

  test "should get edit" do
    get edit_origem_url(@origem)
    assert_response :success
  end

  test "should update origem" do
    patch origem_url(@origem), params: { origem: { descricao: @origem.descricao } }
    assert_redirected_to origem_url(@origem)
  end

  test "should destroy origem" do
    assert_difference("Origem.count", -1) do
      delete origem_url(@origem)
    end

    assert_redirected_to origens_url
  end
end
