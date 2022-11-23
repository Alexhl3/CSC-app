class ProductsController < ApplicationController
  skip_before_action :protect_pages, only: [:index, :show]

  def index
    @categories = Category.order(name: :asc).load_async
    @pagy, @products = pagy(FindProducts.new.call(product_params_index).load_async, items: 12)
  end

  def show
    product
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    @product.final_price = calculate_final_price(product_params)

    if @product.save
      redirect_to administrations_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    authorized?(product)
  end

  def update
    authorized?(product)

    product.final_price = calculate_final_price(product_params)

    if product.update(product_params)
      redirect_to product_path(product.id), notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorized?(product)

    product.destroy

    redirect_to administrations_path, notice: t('.destroyed'), status: :see_other
  end

  def delete_image_attachment
    authorized?

    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :status, :photo, :category_id, :depth, :width, :height,:discount_percent, :discount, :iva_status, images: [])
  end

  def product_params_index
    params.permit(:category_id, :min_price, :max_price, :query_text, :order_by, :page, :favorites, :user_id, :status, :discount, :final_price, category_id: [])
  end

  def product
    @product ||= Product.find(params[:id])
  end

  def calculate_final_price(product_params)
    product = Product.new(product_params)
    if product.iva_status && product.discount
      product.discount_price(product.sum_iva)
    elsif product.iva_status
      product.sum_iva
    elsif product.discount
      product.discount_price
    else
      product.price
    end
  end

end