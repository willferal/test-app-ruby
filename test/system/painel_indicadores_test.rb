require "application_system_test_case"

class PainelIndicadoresTest < ApplicationSystemTestCase
  setup do
    @painel_indicador = painel_indicadores(:one)
  end

  test "visiting the index" do
    visit painel_indicadores_url
    assert_selector "h1", text: "Painel indicadores"
  end

  test "should create painel indicador" do
    visit painel_indicadores_url
    click_on "New painel indicador"

    fill_in "Coluna", with: @painel_indicador.coluna
    fill_in "Indicador", with: @painel_indicador.indicador_id
    fill_in "Painel", with: @painel_indicador.painel_id
    fill_in "Posicao", with: @painel_indicador.posicao
    click_on "Create Painel indicador"

    assert_text "Painel indicador was successfully created"
    click_on "Back"
  end

  test "should update Painel indicador" do
    visit painel_indicador_url(@painel_indicador)
    click_on "Edit this painel indicador", match: :first

    fill_in "Coluna", with: @painel_indicador.coluna
    fill_in "Indicador", with: @painel_indicador.indicador_id
    fill_in "Painel", with: @painel_indicador.painel_id
    fill_in "Posicao", with: @painel_indicador.posicao
    click_on "Update Painel indicador"

    assert_text "Painel indicador was successfully updated"
    click_on "Back"
  end

  test "should destroy Painel indicador" do
    visit painel_indicador_url(@painel_indicador)
    click_on "Destroy this painel indicador", match: :first

    assert_text "Painel indicador was successfully destroyed"
  end
end
