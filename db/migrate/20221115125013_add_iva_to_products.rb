class AddIvaToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :iva_status, :boolean
  end
end
