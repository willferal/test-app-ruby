require "application_system_test_case"

class AtuacoesTest < ApplicationSystemTestCase
  setup do
    @atuacao = atuacoes(:one)
  end

  test "visiting the index" do
    visit atuacoes_url
    assert_selector "h1", text: "Atuacoes"
  end

  test "should create atuacao" do
    visit atuacoes_url
    click_on "New atuacao"

    fill_in "Descricao", with: @atuacao.descricao
    click_on "Create Atuacao"

    assert_text "Atuacao was successfully created"
    click_on "Back"
  end

  test "should update Atuacao" do
    visit atuacao_url(@atuacao)
    click_on "Edit this atuacao", match: :first

    fill_in "Descricao", with: @atuacao.descricao
    click_on "Update Atuacao"

    assert_text "Atuacao was successfully updated"
    click_on "Back"
  end

  test "should destroy Atuacao" do
    visit atuacao_url(@atuacao)
    click_on "Destroy this atuacao", match: :first

    assert_text "Atuacao was successfully destroyed"
  end
end
