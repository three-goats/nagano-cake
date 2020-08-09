class RenameProductTypeIdToProducts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :products, :product_type_id, :products_type_id
  end
end
