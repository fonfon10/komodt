class Product < ApplicationRecord
	belongs_to :supplier
	belongs_to :category 
	belongs_to :sub_category 

	has_many :packages, dependent: :destroy

	validates :name, uniqueness: { case_sensitive: false}
	validates :name, presence: true

	validates :category_id, presence: true
	validates :sub_category_id, presence: true


	
end
