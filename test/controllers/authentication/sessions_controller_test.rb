require "test_helper"

class Authentication::SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:pedro)
  end

  test "new_user_url" do
    get new_session_url

    assert_response :success
  end

  test "should login an user by email" do
    post sessions_url, params: {
      login: @user.email,
      password: 'password'
    }

    assert_redirected_to products_url
  end

  test "should login an user by username" do
    post sessions_url, params: {
      login: @user.username,
      password: 'password'
    }

    assert_redirected_to products_url
  end

  test "should logout user" do
    login
    delete session_url('123')

    assert_redirected_to new_session_url
    assert_equal flash[:notice], 'La sesion ha sido cerrada con exito'
  end
end
