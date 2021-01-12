require "application_system_test_case"

class PoniesTest < ApplicationSystemTestCase
  setup do
    @pony = ponies(:one)
  end

  test "visiting the index" do
    visit ponies_url
    assert_selector "h1", text: "Ponies"
  end

  test "creating a Pony" do
    visit ponies_url
    click_on "New Pony"

    fill_in "Name", with: @pony.name
    fill_in "Profession", with: @pony.profession
    click_on "Create Pony"

    assert_text "Pony was successfully created"
    click_on "Back"
  end

  test "updating a Pony" do
    visit ponies_url
    click_on "Edit", match: :first

    fill_in "Name", with: @pony.name
    fill_in "Profession", with: @pony.profession
    click_on "Update Pony"

    assert_text "Pony was successfully updated"
    click_on "Back"
  end

  test "destroying a Pony" do
    visit ponies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pony was successfully destroyed"
  end
end
