require "test_helper"

class FisicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fisica = fisicas(:one)
  end

  test "should get index" do
    get fisicas_url
    assert_response :success
  end

  test "should get new" do
    get new_fisica_url
    assert_response :success
  end

  test "should create fisica" do
    assert_difference("Fisica.count") do
      post fisicas_url, params: { fisica: { cpf: @fisica.cpf, pessoa_id: @fisica.pessoa_id } }
    end

    assert_redirected_to fisica_url(Fisica.last)
  end

  test "should show fisica" do
    get fisica_url(@fisica)
    assert_response :success
  end

  test "should get edit" do
    get edit_fisica_url(@fisica)
    assert_response :success
  end

  test "should update fisica" do
    patch fisica_url(@fisica), params: { fisica: { cpf: @fisica.cpf, pessoa_id: @fisica.pessoa_id } }
    assert_redirected_to fisica_url(@fisica)
  end

  test "should destroy fisica" do
    assert_difference("Fisica.count", -1) do
      delete fisica_url(@fisica)
    end

    assert_redirected_to fisicas_url
  end
end
