require "test_helper"

class AdministrationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    login
  end

  test "should get table of products" do
    get administrations_url

    assert_response :success
  end

  test 'render all products' do
    get administrations_url

    assert_response :success
    assert_select '.product', 27
  end
end