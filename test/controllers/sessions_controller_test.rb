require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get sessions_create_url
    assert_response :success
  end

  test "should get login" do
    get sessions_login_url
    assert_response :success
  end

  test "should get welcome" do
    get sessions_welcome_url
    assert_response :success
  end

  test "should get gem" do
    get sessions_gem_url
    assert_response :success
  end

  test "should get install" do
    get sessions_install_url
    assert_response :success
  end

  test "should get bcrypt" do
    get sessions_bcrypt_url
    assert_response :success
  end
end
