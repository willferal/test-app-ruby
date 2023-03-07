require "application_system_test_case"

class EntidadesTest < ApplicationSystemTestCase
  setup do
    @entidade = entidades(:one)
  end

  test "visiting the index" do
    visit entidades_url
    assert_selector "h1", text: "Entidades"
  end

  test "should create entidade" do
    visit entidades_url
    click_on "New entidade"

    fill_in "Bairro endereco", with: @entidade.bairro_endereco
    fill_in "Complemento endereco", with: @entidade.complemento_endereco
    fill_in "Cpf cnpj", with: @entidade.cpf_cnpj
    fill_in "Endereco", with: @entidade.endereco
    fill_in "Municipio", with: @entidade.municipio_id
    fill_in "Nome", with: @entidade.nome
    fill_in "Numero endereco", with: @entidade.numero_endereco
    fill_in "Origem", with: @entidade.origem_id
    fill_in "Razao social", with: @entidade.razao_social
    fill_in "Tipo entidade", with: @entidade.tipo_entidade_id
    click_on "Create Entidade"

    assert_text "Entidade was successfully created"
    click_on "Back"
  end

  test "should update Entidade" do
    visit entidade_url(@entidade)
    click_on "Edit this entidade", match: :first

    fill_in "Bairro endereco", with: @entidade.bairro_endereco
    fill_in "Complemento endereco", with: @entidade.complemento_endereco
    fill_in "Cpf cnpj", with: @entidade.cpf_cnpj
    fill_in "Endereco", with: @entidade.endereco
    fill_in "Municipio", with: @entidade.municipio_id
    fill_in "Nome", with: @entidade.nome
    fill_in "Numero endereco", with: @entidade.numero_endereco
    fill_in "Origem", with: @entidade.origem_id
    fill_in "Razao social", with: @entidade.razao_social
    fill_in "Tipo entidade", with: @entidade.tipo_entidade_id
    click_on "Update Entidade"

    assert_text "Entidade was successfully updated"
    click_on "Back"
  end

  test "should destroy Entidade" do
    visit entidade_url(@entidade)
    click_on "Destroy this entidade", match: :first

    assert_text "Entidade was successfully destroyed"
  end
end
