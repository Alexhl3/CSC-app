class DefaultStatusToProduct < ActiveRecord::Migration[7.0]
  def change
    change_column_default :products, :status, true
  end
end
