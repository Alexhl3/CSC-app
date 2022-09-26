class AddNotNullSizeToProduct < ActiveRecord::Migration[7.0]
  def change
    change_column_null :products, :depth, false
    change_column_null :products, :height, false
    change_column_null :products, :width, false
  end
end
