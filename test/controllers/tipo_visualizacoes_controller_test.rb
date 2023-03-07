require "test_helper"

class TipoVisualizacoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_visualizacao = tipo_visualizacoes(:one)
  end

  test "should get index" do
    get tipo_visualizacoes_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_visualizacao_url
    assert_response :success
  end

  test "should create tipo_visualizacao" do
    assert_difference("TipoVisualizacao.count") do
      post tipo_visualizacoes_url, params: { tipo_visualizacao: { descricao: @tipo_visualizacao.descricao, helper_chartkick: @tipo_visualizacao.helper_chartkick } }
    end

    assert_redirected_to tipo_visualizacao_url(TipoVisualizacao.last)
  end

  test "should show tipo_visualizacao" do
    get tipo_visualizacao_url(@tipo_visualizacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_visualizacao_url(@tipo_visualizacao)
    assert_response :success
  end

  test "should update tipo_visualizacao" do
    patch tipo_visualizacao_url(@tipo_visualizacao), params: { tipo_visualizacao: { descricao: @tipo_visualizacao.descricao, helper_chartkick: @tipo_visualizacao.helper_chartkick } }
    assert_redirected_to tipo_visualizacao_url(@tipo_visualizacao)
  end

  test "should destroy tipo_visualizacao" do
    assert_difference("TipoVisualizacao.count", -1) do
      delete tipo_visualizacao_url(@tipo_visualizacao)
    end

    assert_redirected_to tipo_visualizacoes_url
  end
end
