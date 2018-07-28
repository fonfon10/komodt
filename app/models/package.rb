class Package < ApplicationRecord

	belongs_to :product
	belongs_to :unit

	has_many :price_entries

end
