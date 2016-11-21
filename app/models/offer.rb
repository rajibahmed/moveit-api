class Offer < ApplicationRecord
	validates :email, presence: true
	validates :distance, presence: true, numericality: true
	validates :living_space, numericality: true
	validates :attic, numericality: true
	validates :celler, numericality: true

	def calculate
		distance_price + volume_price + piano_price
	end

	def distance_price
		if distance < 50
			(distance * 10) + 1000
		elsif distance > 49 && distance < 100
			(distance * 8) + 5000
		elsif distance > 99
			(distance * 7 ) + 10000
		end
	end

	def volume_price
		1100 * number_of_cars_need
	end

	private ###########

	def piano_price
		has_piano? ? 5000 : 0
	end


	def volume
		living_space + celler_volume + attic_volume
	end

	def number_of_cars_need
		((volume/50.to_f) + 1).floor
	end

	def celler_volume
		2 * celler
	end

	def attic_volume
		2 * attic
	end
end
