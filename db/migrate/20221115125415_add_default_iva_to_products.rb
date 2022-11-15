class AddDefaultIvaToProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :iva_status, :boolean, default: false
  end
end
