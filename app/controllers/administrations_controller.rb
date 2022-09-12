class AdministrationsController < ApplicationController
  def index
    @products = Product.all.order(title: :asc)
  end
end
