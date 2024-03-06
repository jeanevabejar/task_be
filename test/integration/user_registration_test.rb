require "test_helper"

class UserRegistrationTest < ActionDispatch::IntegrationTest
  test "registers a new user" do
    post "/users", params: { user: { email: 'test@example.com', password: 'password123', password_confirmation: 'password123' } }

    assert_response :success
    assert_equal 1, User.count

  end
end
