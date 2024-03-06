require "test_helper"

class UserRegistrationTest < ActionDispatch::IntegrationTest
  test "registers a new user" do
    post "/user", params: { user: { email: 'test@example.com', password: 'password123', password_confirmation: 'password123' } }

    assert_response :created
    assert_equal 1, User.count

  end
end
