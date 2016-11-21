class DistanceController < ApplicationController

	URL = "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=%s&destinations=%s,NY&key=AIzaSyAwnJakQLD1DPjeRgB-oDoBZAMs4WrH2Jo"
	
	def index
		response =  Distance.get(url)

		if response['status'] == 'OK'
			render json: response, status: 422
		else
			render json: { status: 'ERROR', message: 'error occured'}
		end
	end

	def distance_params
		params.permit(:origin, :destination)
	end

	def url
		URL % [distance_params[:origin], distance_params[:destination]]
	end

end
