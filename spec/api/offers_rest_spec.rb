require 'rails_helper'

describe 'api for offers ' do
  context 'GET /offers/:id' do
    it 'provide app when exists' do
      offer  = create(:offer, distance: 10, living_space: 10)

      get offer_path(offer)

      expect(response).to be_ok
      expect(response_json[:id]).to eq(offer.id)
      expect(response_json[:id]).not_to eq("somethingelse")
    end

    it 'provide error when app does exists' do
      get '/offers/1222'

      expect(response).to be_not_found
    end
  end

  context 'POST /offers' do
    it 'creates an offer with valid params' do
      post offers_path, params: {offer: attributes_for(:offer)}

      expect(response).to be_created
      expect(response_json[:email]).to eq('example@email.com')
    end

    it 'error creating offer with invalid params' do
      post offers_path, params: { offer: { distance: 0 }}

      expect(response.status).to eq(422)
      expect(response_json).to have_key(:errors)
    end
  end


  def response_json
    JSON.parse(response.body, symbolize_names: true)
  end
end
