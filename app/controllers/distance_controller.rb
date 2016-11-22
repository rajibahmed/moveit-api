class DistanceController < ApplicationController
	
	def index
		distance =  Distance.new(distance_params)
		response = distance.for_car

		if response['status'] == 'OK'
			render json: response, status: :unprocessable_entity
		else
			render json: Errors.for(:not_found, distance)
		end

	rescue Exception
		render json: Errors.for(:error), status: :service_unavailable
	end

	private #####

	def distance_params
		params.permit(:origin, :destination)
	end
end
