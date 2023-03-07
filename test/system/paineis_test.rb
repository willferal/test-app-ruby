require "application_system_test_case"

class PaineisTest < ApplicationSystemTestCase
  setup do
    @painel = paineis(:one)
  end

  test "visiting the index" do
    visit paineis_url
    assert_selector "h1", text: "Paineis"
  end

  test "should create painel" do
    visit paineis_url
    click_on "New painel"

    check "Ativo" if @painel.ativo
    fill_in "Descricao", with: @painel.descricao
    fill_in "Token", with: @painel.token
    click_on "Create Painel"

    assert_text "Painel was successfully created"
    click_on "Back"
  end

  test "should update Painel" do
    visit painel_url(@painel)
    click_on "Edit this painel", match: :first

    check "Ativo" if @painel.ativo
    fill_in "Descricao", with: @painel.descricao
    fill_in "Token", with: @painel.token
    click_on "Update Painel"

    assert_text "Painel was successfully updated"
    click_on "Back"
  end

  test "should destroy Painel" do
    visit painel_url(@painel)
    click_on "Destroy this painel", match: :first

    assert_text "Painel was successfully destroyed"
  end
end
