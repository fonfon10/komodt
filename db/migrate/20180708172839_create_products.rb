class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :supplier_id
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end
end
