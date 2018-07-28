class CreatePriceEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :price_entries do |t|
      t.integer :package_id
      t.integer :distributor_id
      t.decimal :price
      t.date :date_expirate

      t.timestamps
    end
  end
end
