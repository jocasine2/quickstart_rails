require "application_system_test_case"

class NaturalPeopleTest < ApplicationSystemTestCase
  setup do
    @natural_person = natural_people(:one)
  end

  test "visiting the index" do
    visit natural_people_url
    assert_selector "h1", text: "Natural people"
  end

  test "should create natural person" do
    visit natural_people_url
    click_on "New natural person"

    fill_in "Last name", with: @natural_person.last_name
    fill_in "Name", with: @natural_person.name
    click_on "Create Natural person"

    assert_text "Natural person was successfully created"
    click_on "Back"
  end

  test "should update Natural person" do
    visit natural_person_url(@natural_person)
    click_on "Edit this natural person", match: :first

    fill_in "Last name", with: @natural_person.last_name
    fill_in "Name", with: @natural_person.name
    click_on "Update Natural person"

    assert_text "Natural person was successfully updated"
    click_on "Back"
  end

  test "should destroy Natural person" do
    visit natural_person_url(@natural_person)
    click_on "Destroy this natural person", match: :first

    assert_text "Natural person was successfully destroyed"
  end
end
