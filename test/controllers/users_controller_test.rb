require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
    @user = users(:julia)
  end

  test 'render all products of one user' do
    get user_url(@user.username)

    assert_response :success
  end
end