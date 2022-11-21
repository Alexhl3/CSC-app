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

    if @product.discount
      @product.final_price = @product.discount_price
    else
      @product.final_price = @product.price
    end

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

    # puts product.price
    # puts product.discount
    # puts product.discount_percent

    # puts @product.price
    # puts @product.discount
    # puts @product.discount_percent
    
    # puts product_params[:price]
    # puts product_params[:discount]
    # puts product_params[:discount_percent]

    if product_params[:discount].to_i == 1
      product.final_price = product.discount_price(product_params[:price].to_i, product_params[:discount_percent].to_i)
    else
      product.final_price = product_params[:price].to_i
    end

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
    params.permit(:category_id, :min_price, :max_price, :query_text, :order_by, :page, :favorites, :user_id, :status, :discount, category_id: [])
  end

  def product
    @product ||= Product.find(params[:id])
  end

end