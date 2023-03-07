require "application_system_test_case"

class MunicipiosTest < application_system_test_case
  test "visiting the index" do
    visit municipios_url
    assert_selector "h1", text: "Municipios"
  end
end
