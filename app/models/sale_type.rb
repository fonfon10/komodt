class SaleType < ApplicationRecord
	has_many :price_entries, dependent: :destroy

end
