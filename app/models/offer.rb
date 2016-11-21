class Offer < ApplicationRecord
	validates :email, presence: true
	validates :distance, presence: true, numericality: true
	validates :attic, numericality: true
	validates :celler, numericality: true
	validates :has_paino, inclusion: { in: [true, false]}

	def calculate
		distance_price + celler_price + attic_price + piano_price
	end

	def rules
	end

	def piano_price
		5000
	end

	def distance_price
	 1000	
	end

	def celler_price
		celler && 2 * celler
	end

	def attic_price
		2 * ( attic || 0)
	end

end
