class Unit < ApplicationRecord
	has_many :packages , dependent: :destroy

end
