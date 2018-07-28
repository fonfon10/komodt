class AddSaleTypeIdToPriceEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :price_entries, :sale_type_id, :integer
  end
end
