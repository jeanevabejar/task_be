require "test_helper"

class UserSessionsTest < ActionDispatch::IntegrationTest
  test "registers a new user, login,  and category" do
    post "/users", params: { user: { email: 'test@example.com', password: 'password123', password_confirmation: 'password123' } }
    
    post "/users/sign_in", params: { user: { email: 'test@example.com', password: 'password123' } }
    token = response.headers['Authorization']

    # post "/categories", params:{
    #   name: "Chore"
    # }, headers: { 'Authorization': token }

    assert_response :success
    assert_equal 1, User.count
    # assert_equal 1, Category.count 


  end

end
