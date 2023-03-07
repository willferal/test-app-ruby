require "test_helper"

class PaineisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @painel = paineis(:one)
  end

  test "should get index" do
    get paineis_url
    assert_response :success
  end

  test "should get new" do
    get new_painel_url
    assert_response :success
  end

  test "should create painel" do
    assert_difference("Painel.count") do
      post paineis_url, params: { painel: { ativo: @painel.ativo, descricao: @painel.descricao, token: @painel.token } }
    end

    assert_redirected_to painel_url(Painel.last)
  end

  test "should show painel" do
    get painel_url(@painel)
    assert_response :success
  end

  test "should get edit" do
    get edit_painel_url(@painel)
    assert_response :success
  end

  test "should update painel" do
    patch painel_url(@painel), params: { painel: { ativo: @painel.ativo, descricao: @painel.descricao, token: @painel.token } }
    assert_redirected_to painel_url(@painel)
  end

  test "should destroy painel" do
    assert_difference("Painel.count", -1) do
      delete painel_url(@painel)
    end

    assert_redirected_to paineis_url
  end
end
