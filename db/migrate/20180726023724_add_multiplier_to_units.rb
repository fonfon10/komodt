class AddMultiplierToUnits < ActiveRecord::Migration[5.1]
  def change
    add_column :units, :multiplier, :decimal
  end
end
