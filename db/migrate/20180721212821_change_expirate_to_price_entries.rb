class ChangeExpirateToPriceEntries < ActiveRecord::Migration[5.1]
  def change
  	rename_column :price_entries, :date_expirate, :expiration_date

  end
end
