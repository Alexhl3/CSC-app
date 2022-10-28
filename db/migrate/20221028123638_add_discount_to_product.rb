class AddDiscountToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :discount, :boolean
    add_column :products, :discount_percent, :integer
  end
end
