class AddUserIdToPriceEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :price_entries, :user_id, :integer
  end
end
