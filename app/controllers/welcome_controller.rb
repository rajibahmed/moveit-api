class WelcomeController < ApplicationController
	def health
		head :ok
	end
end
