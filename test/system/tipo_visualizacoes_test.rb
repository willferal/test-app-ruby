require "application_system_test_case"

class TipoVisualizacoesTest < ApplicationSystemTestCase
  setup do
    @tipo_visualizacao = tipo_visualizacoes(:one)
  end

  test "visiting the index" do
    visit tipo_visualizacoes_url
    assert_selector "h1", text: "Tipo visualizacoes"
  end

  test "should create tipo visualizacao" do
    visit tipo_visualizacoes_url
    click_on "New tipo visualizacao"

    fill_in "Descricao", with: @tipo_visualizacao.descricao
    fill_in "Helper chartkick", with: @tipo_visualizacao.helper_chartkick
    click_on "Create Tipo visualizacao"

    assert_text "Tipo visualizacao was successfully created"
    click_on "Back"
  end

  test "should update Tipo visualizacao" do
    visit tipo_visualizacao_url(@tipo_visualizacao)
    click_on "Edit this tipo visualizacao", match: :first

    fill_in "Descricao", with: @tipo_visualizacao.descricao
    fill_in "Helper chartkick", with: @tipo_visualizacao.helper_chartkick
    click_on "Update Tipo visualizacao"

    assert_text "Tipo visualizacao was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo visualizacao" do
    visit tipo_visualizacao_url(@tipo_visualizacao)
    click_on "Destroy this tipo visualizacao", match: :first

    assert_text "Tipo visualizacao was successfully destroyed"
  end
end
