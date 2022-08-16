require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render all products' do
    get products_path

    assert_response :success
    assert_select '.product', 3
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
        price: 230,
        category_id: categories(:newMachines).id
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'El producto ha sido creado con exito!!'
  end

  test 'allow to edit a product' do
    patch product_path(products(:machine1)), params: {
      product: {
        title: 'maquina XXJ4',
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'El producto ha sido actualizado con exito!!'
  end

  test 'dont allow to create new product with empty field' do
    post products_path, params: {
      product: {
        title: '',
        description: 'Maquina en buen estado.',
        price: 230
      }
    }

    assert_response :unprocessable_entity
  end

  test 'dont allow to edit a product with empty field' do
    post products_path, params: {
      product: {
        title: '',
      }
    }

    assert_response :unprocessable_entity
  end

  test 'render edit product from' do
    get edit_product_path(products(:machine1))

    assert_response :success
    assert_select 'form'
  end

  test 'allow to delete product' do
    assert_difference('Product.count', -1) do
    delete product_path(products(:machine1))
    end

    assert_redirected_to products_path
    assert_equal flash[:notice], 'El producto ha sido eliminado'
  end
end