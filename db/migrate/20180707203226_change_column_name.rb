class ChangeColumnName < ActiveRecord::Migration[5.1]
 def change
    rename_column :suppliers, :Name, :name
 end
end