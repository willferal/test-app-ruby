require "application_system_test_case"

class TipoDetalhesTest < ApplicationSystemTestCase
  setup do
    @tipo_detalhe = tipo_detalhes(:one)
  end

  test "visiting the index" do
    visit tipo_detalhes_url
    assert_selector "h1", text: "Tipo detalhes"
  end

  test "should create tipo detalhe" do
    visit tipo_detalhes_url
    click_on "New tipo detalhe"

    fill_in "Descricao", with: @tipo_detalhe.descricao
    click_on "Create Tipo detalhe"

    assert_text "Tipo detalhe was successfully created"
    click_on "Back"
  end

  test "should update Tipo detalhe" do
    visit tipo_detalhe_url(@tipo_detalhe)
    click_on "Edit this tipo detalhe", match: :first

    fill_in "Descricao", with: @tipo_detalhe.descricao
    click_on "Update Tipo detalhe"

    assert_text "Tipo detalhe was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo detalhe" do
    visit tipo_detalhe_url(@tipo_detalhe)
    click_on "Destroy this tipo detalhe", match: :first

    assert_text "Tipo detalhe was successfully destroyed"
  end
end
