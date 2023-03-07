require "application_system_test_case"

class IndicadoresTest < ApplicationSystemTestCase
  setup do
    @indicador = indicadores(:one)
  end

  test "visiting the index" do
    visit indicadores_url
    assert_selector "h1", text: "Indicadores"
  end

  test "should create indicador" do
    visit indicadores_url
    click_on "New indicador"

    fill_in "Area", with: @indicador.area_id
    check "Ativo" if @indicador.ativo
    fill_in "Descricao", with: @indicador.descricao
    fill_in "Intervalo sincronizacao", with: @indicador.intervalo_sincronizacao
    check "Label visivel" if @indicador.label_visivel
    fill_in "Texto eixo x", with: @indicador.texto_eixo_x
    fill_in "Texto eixo y", with: @indicador.texto_eixo_y
    fill_in "Tipo visualizacao", with: @indicador.tipo_visualizacao_id
    fill_in "Titulo", with: @indicador.titulo
    fill_in "Token", with: @indicador.token
    fill_in "Url servico", with: @indicador.url_servico
    fill_in "Valor", with: @indicador.valor
    fill_in "Valor simples", with: @indicador.valor_simples
    click_on "Create Indicador"

    assert_text "Indicador was successfully created"
    click_on "Back"
  end

  test "should update Indicador" do
    visit indicador_url(@indicador)
    click_on "Edit this indicador", match: :first

    fill_in "Area", with: @indicador.area_id
    check "Ativo" if @indicador.ativo
    fill_in "Descricao", with: @indicador.descricao
    fill_in "Intervalo sincronizacao", with: @indicador.intervalo_sincronizacao
    check "Label visivel" if @indicador.label_visivel
    fill_in "Texto eixo x", with: @indicador.texto_eixo_x
    fill_in "Texto eixo y", with: @indicador.texto_eixo_y
    fill_in "Tipo visualizacao", with: @indicador.tipo_visualizacao_id
    fill_in "Titulo", with: @indicador.titulo
    fill_in "Token", with: @indicador.token
    fill_in "Url servico", with: @indicador.url_servico
    fill_in "Valor", with: @indicador.valor
    fill_in "Valor simples", with: @indicador.valor_simples
    click_on "Update Indicador"

    assert_text "Indicador was successfully updated"
    click_on "Back"
  end

  test "should destroy Indicador" do
    visit indicador_url(@indicador)
    click_on "Destroy this indicador", match: :first

    assert_text "Indicador was successfully destroyed"
  end
end
