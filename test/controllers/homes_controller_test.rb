require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index of home" do
    get homes_url

    assert_response :success
  end
end