require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @admin_params = {
      user: {
        username: "attacker",
        email: "attacker@example.com",
        admin: true
      }
    }
    @regular_params = {
      user: {
        username: "regular",
        email: "regular@example.com",
      }
    }
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should create an admin user" do
    assert_difference "User.count" do
      post users_url, params: @admin_params
    end

    assert_redirected_to users_path
    assert_equal "true", User.last.admin
  end

  test "should create a regular user" do
    assert_difference "User.count" do
      post users_url, params: @regular_params
    end

    assert_equal nil, User.last.admin
  end
end
