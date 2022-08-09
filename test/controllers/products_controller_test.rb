require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render all products' do
    get products_path

    assert_response :success
    assert_select '.product', 2
  end
  
  test 'render detail product view' do
    get product_path(products(:machine1))
    
    assert_response :success
    assert_select '.title', 'Maquina HH22O'
    assert_select '.description', 'Maquina bien cuidada.'
    assert_select '.price', '$200'
  end
end