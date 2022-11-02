class AddDefaultDiscountPercentToProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :discount_percent, :integer, default: 0
  end
end
