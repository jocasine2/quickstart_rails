require "test_helper"

class NaturalPeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @natural_person = natural_people(:one)
  end

  test "should get index" do
    get natural_people_url
    assert_response :success
  end

  test "should get new" do
    get new_natural_person_url
    assert_response :success
  end

  test "should create natural_person" do
    assert_difference("NaturalPerson.count") do
      post natural_people_url, params: { natural_person: { last_name: @natural_person.last_name, name: @natural_person.name } }
    end

    assert_redirected_to natural_person_url(NaturalPerson.last)
  end

  test "should show natural_person" do
    get natural_person_url(@natural_person)
    assert_response :success
  end

  test "should get edit" do
    get edit_natural_person_url(@natural_person)
    assert_response :success
  end

  test "should update natural_person" do
    patch natural_person_url(@natural_person), params: { natural_person: { last_name: @natural_person.last_name, name: @natural_person.name } }
    assert_redirected_to natural_person_url(@natural_person)
  end

  test "should destroy natural_person" do
    assert_difference("NaturalPerson.count", -1) do
      delete natural_person_url(@natural_person)
    end

    assert_redirected_to natural_people_url
  end
end
