require "application_system_test_case"

class CatergoriesTest < ApplicationSystemTestCase
  setup do
    @catergory = catergories(:one)
  end

  test "visiting the index" do
    visit catergories_url
    assert_selector "h1", text: "Catergories"
  end

  test "should create catergory" do
    visit catergories_url
    click_on "New catergory"

    click_on "Create Catergory"

    assert_text "Catergory was successfully created"
    click_on "Back"
  end

  test "should update Catergory" do
    visit catergory_url(@catergory)
    click_on "Edit this catergory", match: :first

    click_on "Update Catergory"

    assert_text "Catergory was successfully updated"
    click_on "Back"
  end

  test "should destroy Catergory" do
    visit catergory_url(@catergory)
    click_on "Destroy this catergory", match: :first

    assert_text "Catergory was successfully destroyed"
  end
end
