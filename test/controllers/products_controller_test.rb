require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
  end
  test 'render all products' do
    get products_path

    assert_response :success
    assert_select '.product', 12
    assert_select '.category', 8
  end

  test 'render detail product view' do
    get product_path(products(:machine1))

    assert_response :success
    assert_select '.title', 'Maquina 1'
    assert_select '.price', '$200'
  end

  test 'render detail discunt product view' do
    get product_path(products(:machine3))

    assert_response :success
    assert_select '.title', 'Maquina 3'
    assert_select '.discount_percent', '-75%'
    assert_select '.price', '$18'
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
        category_id: categories(:newMachines).id,
        status: true,
        depth: 8,
        width: 7,
        height: 2,
        photo: fixture_file_upload('maquinaN1.png', 'image/png'),
        images: [fixture_file_upload('maquinaN1.png', 'image/png'), fixture_file_upload('maquinaN2.png', 'image/png')]
      }
    }

    assert_redirected_to administrations_path
    assert_equal flash[:notice], 'El producto ha sido creado con exito!!'
  end

  test 'allow to edit a product' do
    patch product_path(products(:machine1)), params: {
      product: {
        title: 'maquina XXJ4',
      }
    }

    assert_redirected_to product_path(products(:machine1))
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
    patch product_path(products(:machine1)), params: {
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

    assert_redirected_to administrations_path
    assert_equal flash[:notice], 'El producto ha sido eliminado'
  end

  test 'filter products by category' do
    get products_path(category_id: categories(:balanceMachines))

    assert_response :success
    assert_select '.product', 7
  end

  test 'filter products by min_price' do
    get products_path(min_price: 200)

    assert_response :success
    assert_select '.product', 12
  end

  test 'filter products by max_price' do
    get products_path(max_price: 150)

    assert_response :success
    assert_select '.product', 12
  end

  test 'filter products by discount' do
    get products_path(discount: true)

    assert_response :success
    assert_select '.product', 6
  end

  test 'filter products by query_text' do
    get products_path(query_text: products(:machine1).title)

    assert_response :success
    assert_select '.product', 11
  end

  test 'sort products by expensive' do
    get products_path(order_by: 'expensive')

    assert_response :success
    assert_select '.product', 12
    assert_select '.products .product:first-child h2', 'Maquina 21'
  end

  test 'sort products by cheapest' do
    get products_path(order_by: 'cheapest')

    assert_response :success
    assert_select '.product', 12
    assert_select '.products .product:first-child h2', 'Maquina 5'
  end

  # test 'delete a attached image' do
  #   delete delete_image_attachment_product_path(products(:machine1).photo.id)

  #   assert_redirected_to products_path
  # end
end