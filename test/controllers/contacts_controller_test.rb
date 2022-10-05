require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get contact us form" do
    get new_contact_url

    assert_response :success
  end

  test 'should send a message' do
    post contacts_path, params: {
      contact: {
        name: "Andrea",
        email: "andr@csc.com",
        message: 'Saludos.'
      }
    }

    assert_redirected_to homes_path
    assert_equal flash[:notice], 'Tu mensaje ha sido enviado, gracias por contactarnos!!'
  end
end