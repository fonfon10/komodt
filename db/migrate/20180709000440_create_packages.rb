class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.integer :product_id
      t.string :barcode
      t.integer :pkgsize
      t.integer :size
      t.integer :unit_id

      t.timestamps
    end
  end
end
