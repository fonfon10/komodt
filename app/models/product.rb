class Product < ApplicationRecord
	belongs_to :supplier
	belongs_to :category 
	belongs_to :sub_category 

	has_many :packages
	
end
