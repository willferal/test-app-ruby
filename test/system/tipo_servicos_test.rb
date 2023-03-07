require "application_system_test_case"

class TipoServicosTest < ApplicationSystemTestCase
  setup do
    @tipo_servico = tipo_servicos(:one)
  end

  test "visiting the index" do
    visit tipo_servicos_url
    assert_selector "h1", text: "Tipo servicos"
  end

  test "should create tipo servico" do
    visit tipo_servicos_url
    click_on "New tipo servico"

    fill_in "Descricao", with: @tipo_servico.descricao
    click_on "Create Tipo servico"

    assert_text "Tipo servico was successfully created"
    click_on "Back"
  end

  test "should update Tipo servico" do
    visit tipo_servico_url(@tipo_servico)
    click_on "Edit this tipo servico", match: :first

    fill_in "Descricao", with: @tipo_servico.descricao
    click_on "Update Tipo servico"

    assert_text "Tipo servico was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo servico" do
    visit tipo_servico_url(@tipo_servico)
    click_on "Destroy this tipo servico", match: :first

    assert_text "Tipo servico was successfully destroyed"
  end
end
