require "test_helper"

class TipoDetalhesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_detalhe = tipo_detalhes(:one)
  end

  test "should get index" do
    get tipo_detalhes_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_detalhe_url
    assert_response :success
  end

  test "should create tipo_detalhe" do
    assert_difference("TipoDetalhe.count") do
      post tipo_detalhes_url, params: { tipo_detalhe: { descricao: @tipo_detalhe.descricao } }
    end

    assert_redirected_to tipo_detalhe_url(TipoDetalhe.last)
  end

  test "should show tipo_detalhe" do
    get tipo_detalhe_url(@tipo_detalhe)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_detalhe_url(@tipo_detalhe)
    assert_response :success
  end

  test "should update tipo_detalhe" do
    patch tipo_detalhe_url(@tipo_detalhe), params: { tipo_detalhe: { descricao: @tipo_detalhe.descricao } }
    assert_redirected_to tipo_detalhe_url(@tipo_detalhe)
  end

  test "should destroy tipo_detalhe" do
    assert_difference("TipoDetalhe.count", -1) do
      delete tipo_detalhe_url(@tipo_detalhe)
    end

    assert_redirected_to tipo_detalhes_url
  end
end
