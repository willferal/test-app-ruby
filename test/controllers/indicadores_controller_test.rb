require "test_helper"

class IndicadoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @indicador = indicadores(:one)
  end

  test "should get index" do
    get indicadores_url
    assert_response :success
  end

  test "should get new" do
    get new_indicador_url
    assert_response :success
  end

  test "should create indicador" do
    assert_difference("Indicador.count") do
      post indicadores_url, params: { indicador: { area_id: @indicador.area_id, ativo: @indicador.ativo, descricao: @indicador.descricao, intervalo_sincronizacao: @indicador.intervalo_sincronizacao, label_visivel: @indicador.label_visivel, texto_eixo_x: @indicador.texto_eixo_x, texto_eixo_y: @indicador.texto_eixo_y, tipo_visualizacao_id: @indicador.tipo_visualizacao_id, titulo: @indicador.titulo, token: @indicador.token, url_servico: @indicador.url_servico, valor: @indicador.valor, valor_simples: @indicador.valor_simples } }
    end

    assert_redirected_to indicador_url(Indicador.last)
  end

  test "should show indicador" do
    get indicador_url(@indicador)
    assert_response :success
  end

  test "should get edit" do
    get edit_indicador_url(@indicador)
    assert_response :success
  end

  test "should update indicador" do
    patch indicador_url(@indicador), params: { indicador: { area_id: @indicador.area_id, ativo: @indicador.ativo, descricao: @indicador.descricao, intervalo_sincronizacao: @indicador.intervalo_sincronizacao, label_visivel: @indicador.label_visivel, texto_eixo_x: @indicador.texto_eixo_x, texto_eixo_y: @indicador.texto_eixo_y, tipo_visualizacao_id: @indicador.tipo_visualizacao_id, titulo: @indicador.titulo, token: @indicador.token, url_servico: @indicador.url_servico, valor: @indicador.valor, valor_simples: @indicador.valor_simples } }
    assert_redirected_to indicador_url(@indicador)
  end

  test "should destroy indicador" do
    assert_difference("Indicador.count", -1) do
      delete indicador_url(@indicador)
    end

    assert_redirected_to indicadores_url
  end
end
