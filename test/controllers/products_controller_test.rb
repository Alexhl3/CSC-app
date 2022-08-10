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

  test 'render new product from' do
    get new_product_path

    assert_response :success
    assert_select 'form'
  end

  test 'allow to create new product' do
    post products_path, params: {
      product: {
        title: 'maquina XXJ4',
        description: 'Maquina en buen estado.',
        price: 230
      }
    }

    assert_redirected_to products_path
  end
end