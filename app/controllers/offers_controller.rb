class OffersController < ApplicationController

  def show
    render json: offer
  rescue ActiveRecord::RecordNotFound
    render json: Errors.for(:not_found), status: :not_found
  end

  def create
    offer = Offer.build(offer_params)

    if offer.save
      render json: app, status: :created
    else
      render json: Errors.for(:validation_failed, model: offer), status: :unprocessable_entity
    end
  end

	private #####

	def offer
		Offer.find(params[:id])
  end

 def offer_params
	 params.require(:email, :distance).permit(:celler, :attic, :living_space)
  end
end
