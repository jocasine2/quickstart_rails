require "application_system_test_case"

class FisicasTest < ApplicationSystemTestCase
  setup do
    @fisica = fisicas(:one)
  end

  test "visiting the index" do
    visit fisicas_url
    assert_selector "h1", text: "Fisicas"
  end

  test "should create fisica" do
    visit fisicas_url
    click_on "New fisica"

    fill_in "Cpf", with: @fisica.cpf
    fill_in "Pessoa", with: @fisica.pessoa_id
    click_on "Create Fisica"

    assert_text "Fisica was successfully created"
    click_on "Back"
  end

  test "should update Fisica" do
    visit fisica_url(@fisica)
    click_on "Edit this fisica", match: :first

    fill_in "Cpf", with: @fisica.cpf
    fill_in "Pessoa", with: @fisica.pessoa_id
    click_on "Update Fisica"

    assert_text "Fisica was successfully updated"
    click_on "Back"
  end

  test "should destroy Fisica" do
    visit fisica_url(@fisica)
    click_on "Destroy this fisica", match: :first

    assert_text "Fisica was successfully destroyed"
  end
end
