require "application_system_test_case"

class OrigensTest < ApplicationSystemTestCase
  setup do
    @origem = origens(:one)
  end

  test "visiting the index" do
    visit origens_url
    assert_selector "h1", text: "Origens"
  end

  test "should create origem" do
    visit origens_url
    click_on "New origem"

    fill_in "Descricao", with: @origem.descricao
    click_on "Create Origem"

    assert_text "Origem was successfully created"
    click_on "Back"
  end

  test "should update Origem" do
    visit origem_url(@origem)
    click_on "Edit this origem", match: :first

    fill_in "Descricao", with: @origem.descricao
    click_on "Update Origem"

    assert_text "Origem was successfully updated"
    click_on "Back"
  end

  test "should destroy Origem" do
    visit origem_url(@origem)
    click_on "Destroy this origem", match: :first

    assert_text "Origem was successfully destroyed"
  end
end
