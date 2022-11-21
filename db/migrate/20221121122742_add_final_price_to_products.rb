class AddFinalPriceToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :final_price, :integer
  end
end
