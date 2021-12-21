require "application_system_test_case"

class GruppesTest < ApplicationSystemTestCase
  setup do
    @gruppe = gruppes(:one)
  end

  test "visiting the index" do
    visit gruppes_url
    assert_selector "h1", text: "Gruppes"
  end

  test "creating a Gruppe" do
    visit gruppes_url
    click_on "New Gruppe"

    fill_in "Name", with: @gruppe.name
    click_on "Create Gruppe"

    assert_text "Gruppe was successfully created"
    click_on "Back"
  end

  test "updating a Gruppe" do
    visit gruppes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @gruppe.name
    click_on "Update Gruppe"

    assert_text "Gruppe was successfully updated"
    click_on "Back"
  end

  test "destroying a Gruppe" do
    visit gruppes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gruppe was successfully destroyed"
  end
end
