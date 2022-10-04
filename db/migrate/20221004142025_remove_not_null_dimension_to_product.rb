class RemoveNotNullDimensionToProduct < ActiveRecord::Migration[7.0]
  def change
    change_column_null :products, :depth, true
    change_column_null :products, :height, true
    change_column_null :products, :width, true
  end
end
