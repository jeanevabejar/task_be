require "test_helper"

class UserSessionsTest < ActionDispatch::IntegrationTest
  test "registers a new user and login" do
    post "/users", params: { user: { email: 'test@example.com', password: 'password123', password_confirmation: 'password123' } }
    
    post "/users/sign_in", params: { user: { email: 'test@example.com', password: 'password123' } }

    assert_response :success
    assert_equal 1, User.count

    if response.status == :success
      puts "PASSED"
      elsif response.status == 401
        puts "Failed test"
    end

  end

  # test "create category" do



  # end
end
