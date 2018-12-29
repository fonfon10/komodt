class SubCategory < ApplicationRecord
	has_many :products, dependent: :destroy

	belongs_to :category
end
