class Offer < ApplicationRecord
	
	DISTANCE_FIRST_BASE		= 1000
	DISTANCE_FIRST_PER_KM = 10
	DISTANCE_SECOND_BASE	= 5000
	DISTANCE_SECOND_PER_KM = 8
	DISTANCE_THIRD_BASE		= 10000
	DISTANCE_THIRD_PER_KM	= 7
	PIANO_SHIPPING_PRICE	= 5000
	VOLUME_PRICE_PER_CAR	= 1100

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
			(distance * DISTANCE_FIRST_PER_KM) + DISTANCE_FIRST_BASE
		elsif distance > 49 && distance < 100
			(distance * DISTANCE_SECOND_PER_KM) + DISTANCE_SECOND_BASE
		elsif distance > 99
			(distance * DISTANCE_THIRD_PER_KM ) + DISTANCE_THIRD_BASE
		end
	end

	def volume_price
		VOLUME_PRICE_PER_CAR * number_of_cars
	end

	def as_json(options)
		super.merge({ price: calculate })
	end

	private ###########

	def piano_price
		has_piano? ? PIANO_SHIPPING_PRICE : 0
	end

	def volume
		living_space + celler_volume + attic_volume
	end

	def number_of_cars
		((volume/50.to_f) + 1).floor
	end

	def celler_volume
		2 * celler
	end

	def attic_volume
		2 * attic
	end
end
