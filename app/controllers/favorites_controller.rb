class FavoritesController < ApplicationController
  def index
  end

  def create
    product.favorite!
    respond_to do |format|
      format.html do
        redirect_to product_path(product)
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('favorites', partial: 'products/favorites', locals: { product: product } )
      end
    end
  end

  def destroy
    product.unfavorite
    respond_to do |format|
      format.html do
        redirect_to product_path(product)
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('favorites', partial: 'products/favorites', locals: { product: product } )
      end
    end
  end

  private

  def product
    @product ||= Product.find(params[:product_id])
  end
end