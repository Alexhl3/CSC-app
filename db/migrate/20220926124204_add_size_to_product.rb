class AddSizeToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :depth, :decimal
    add_column :products, :width, :decimal
    add_column :products, :height, :decimal
  end
end
