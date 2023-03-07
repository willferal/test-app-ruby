require "test_helper"

class PainelIndicadoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @painel_indicador = painel_indicadores(:one)
  end

  test "should get index" do
    get painel_indicadores_url
    assert_response :success
  end

  test "should get new" do
    get new_painel_indicador_url
    assert_response :success
  end

  test "should create painel_indicador" do
    assert_difference("PainelIndicador.count") do
      post painel_indicadores_url, params: { painel_indicador: { coluna: @painel_indicador.coluna, indicador_id: @painel_indicador.indicador_id, painel_id: @painel_indicador.painel_id, posicao: @painel_indicador.posicao } }
    end

    assert_redirected_to painel_indicador_url(PainelIndicador.last)
  end

  test "should show painel_indicador" do
    get painel_indicador_url(@painel_indicador)
    assert_response :success
  end

  test "should get edit" do
    get edit_painel_indicador_url(@painel_indicador)
    assert_response :success
  end

  test "should update painel_indicador" do
    patch painel_indicador_url(@painel_indicador), params: { painel_indicador: { coluna: @painel_indicador.coluna, indicador_id: @painel_indicador.indicador_id, painel_id: @painel_indicador.painel_id, posicao: @painel_indicador.posicao } }
    assert_redirected_to painel_indicador_url(@painel_indicador)
  end

  test "should destroy painel_indicador" do
    assert_difference("PainelIndicador.count", -1) do
      delete painel_indicador_url(@painel_indicador)
    end

    assert_redirected_to painel_indicadores_url
  end
end
