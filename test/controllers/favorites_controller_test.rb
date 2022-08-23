require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
    @product = products(:machine11)
    @liked = products(:machine8)
  end

  test 'should create favorite' do
    assert_difference('Favorite.count', 1) do
      post favorites_url(product_id: @product.id)
    end


    assert_redirected_to product_path(@product)
  end

  test 'should destroy favorite' do
    assert_difference('Favorite.count', -1) do
      delete favorite_url(@liked.id)
    end


    assert_redirected_to product_path(@liked)
  end
end