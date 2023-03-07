require "application_system_test_case"

class FormatacoesTest < ApplicationSystemTestCase
  setup do
    @formatacao = formatacoes(:one)
  end

  test "visiting the index" do
    visit formatacoes_url
    assert_selector "h1", text: "Formatacoes"
  end

  test "should create formatacao" do
    visit formatacoes_url
    click_on "New formatacao"

    fill_in "Descricao", with: @formatacao.descricao
    click_on "Create Formatacao"

    assert_text "Formatacao was successfully created"
    click_on "Back"
  end

  test "should update Formatacao" do
    visit formatacao_url(@formatacao)
    click_on "Edit this formatacao", match: :first

    fill_in "Descricao", with: @formatacao.descricao
    click_on "Update Formatacao"

    assert_text "Formatacao was successfully updated"
    click_on "Back"
  end

  test "should destroy Formatacao" do
    visit formatacao_url(@formatacao)
    click_on "Destroy this formatacao", match: :first

    assert_text "Formatacao was successfully destroyed"
  end
end
