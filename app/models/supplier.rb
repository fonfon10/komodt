class Supplier < ApplicationRecord
	has_many :products, dependent: :destroy

	validates :name, uniqueness: { case_sensitive: false}
	validates :name, presence: true
end
