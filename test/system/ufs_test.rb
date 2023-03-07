require "application_system_test_case"

class UfsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit ufs_url
    assert_selector "h1", text: "Ufs"
  end
end
