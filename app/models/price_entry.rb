class PriceEntry < ApplicationRecord

	belongs_to :distributor
	belongs_to :package
	belongs_to :sale_type


end
