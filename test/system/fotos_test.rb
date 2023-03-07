require "application_system_test_case"

class FotosTest < ApplicationSystemTestCase
  setup do
    @foto = fotos(:one)
  end

  test "visiting the index" do
    visit fotos_url
    assert_selector "h1", text: "Fotos"
  end

  test "should create foto" do
    visit fotos_url
    click_on "New foto"

    fill_in "Nome arquivo", with: @foto.nome_arquivo
    fill_in "Servico", with: @foto.servico_id
    fill_in "Titulo", with: @foto.titulo
    fill_in "Token", with: @foto.token
    click_on "Create Foto"

    assert_text "Foto was successfully created"
    click_on "Back"
  end

  test "should update Foto" do
    visit foto_url(@foto)
    click_on "Edit this foto", match: :first

    fill_in "Nome arquivo", with: @foto.nome_arquivo
    fill_in "Servico", with: @foto.servico_id
    fill_in "Titulo", with: @foto.titulo
    fill_in "Token", with: @foto.token
    click_on "Update Foto"

    assert_text "Foto was successfully updated"
    click_on "Back"
  end

  test "should destroy Foto" do
    visit foto_url(@foto)
    click_on "Destroy this foto", match: :first

    assert_text "Foto was successfully destroyed"
  end
end
