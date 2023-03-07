require "application_system_test_case"

class TipoEntidadesTest < ApplicationSystemTestCase
  setup do
    @tipo_entidade = tipo_entidades(:one)
  end

  test "visiting the index" do
    visit tipo_entidades_url
    assert_selector "h1", text: "Tipo entidades"
  end

  test "should create tipo entidade" do
    visit tipo_entidades_url
    click_on "New tipo entidade"

    fill_in "Descricao", with: @tipo_entidade.descricao
    click_on "Create Tipo entidade"

    assert_text "Tipo entidade was successfully created"
    click_on "Back"
  end

  test "should update Tipo entidade" do
    visit tipo_entidade_url(@tipo_entidade)
    click_on "Edit this tipo entidade", match: :first

    fill_in "Descricao", with: @tipo_entidade.descricao
    click_on "Update Tipo entidade"

    assert_text "Tipo entidade was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo entidade" do
    visit tipo_entidade_url(@tipo_entidade)
    click_on "Destroy this tipo entidade", match: :first

    assert_text "Tipo entidade was successfully destroyed"
  end
end
