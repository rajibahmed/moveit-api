require 'rails_helper'

RSpec.describe Offer, type: :model do
  context 'validations' do
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:distance) }
		it { should validate_numericality_of(:distance) }
		it { should validate_numericality_of(:living_space) }
		it { should validate_numericality_of(:attic) }
		it { should validate_numericality_of(:celler) }
  end

	context '#calculate' do
		it 'adds all prices' do
			offer = build(:offer)

			expect(offer.calculate).to eq(5000)
		end

		it 'price for no piano' do
			offer = build(:offer,  has_piano: false )

			expect(offer.calculate).to eq(1000)
		end

		it 'price for only distance' do
			offer = build(:offer, living_space: 0, attic: 0, celler: 0, has_piano: false )
			expect(offer.calculate).to eq(10700)

			offer.distance = 99
			expect(offer.calculate).to eq(5792)
			
			offer.distance = 51
			expect(offer.calculate).to eq(5408)

			offer.distance = 49
			expect(offer.calculate).to eq(1490)
			
			offer.distance = 10
			expect(offer.calculate).to eq(1100)
		end

		it 'price for only living_space' do
			offer = build(:offer, living_space: 49)
			expect(offer.volume_price).to eq(1100)

			offer = build(:offer, living_space: 10, attic: 25)
			expect(offer.volume_price).to eq(2200)

			offer = build(:offer, living_space: 50)
			expect(offer.volume_price).to eq(2200)

			offer = build(:offer, living_space: 100)
			expect(offer.volume_price).to eq(3300)

			offer = build(:offer, living_space: 150)
			expect(offer.volume_price).to eq(3300)
		end
		
		it 'price for only distance, living space, celler'
			
	end
end
