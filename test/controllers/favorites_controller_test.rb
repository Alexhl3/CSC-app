require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
    @product = products(:machine5)
  end

  test 'should create favorite' do
    assert_difference('Favorite.count', 1) do
      post favorites_url(product_id: @product.id)
    end


    assert_redirected_to product_path(@product)
  end
end