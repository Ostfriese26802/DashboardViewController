require "test_helper"

class GruppesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gruppe = gruppes(:one)
  end

  test "should get index" do
    get gruppes_url
    assert_response :success
  end

  test "should get new" do
    get new_gruppe_url
    assert_response :success
  end

  test "should create gruppe" do
    assert_difference('Gruppe.count') do
      post gruppes_url, params: { gruppe: { name: @gruppe.name } }
    end

    assert_redirected_to gruppe_url(Gruppe.last)
  end

  test "should show gruppe" do
    get gruppe_url(@gruppe)
    assert_response :success
  end

  test "should get edit" do
    get edit_gruppe_url(@gruppe)
    assert_response :success
  end

  test "should update gruppe" do
    patch gruppe_url(@gruppe), params: { gruppe: { name: @gruppe.name } }
    assert_redirected_to gruppe_url(@gruppe)
  end

  test "should destroy gruppe" do
    assert_difference('Gruppe.count', -1) do
      delete gruppe_url(@gruppe)
    end

    assert_redirected_to gruppes_url
  end
end
