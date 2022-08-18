require "test_helper"

class Authentication::UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    login
  end

  test "new_user_url" do
    get new_user_url

    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { email: 'test@csc.com', username: 'testname', password: 'testpass' } }
    end

    assert_redirected_to products_url
  end
end
