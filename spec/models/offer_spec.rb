require 'rails_helper'

RSpec.describe Offer, type: :model do
  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:origin) }
    it { should validate_presence_of(:destination) }
    it { should validate_presence_of(:distance) }
    it { should validate_numericality_of(:distance) }
    it { should validate_numericality_of(:living_space) }
    it { should validate_numericality_of(:attic) }
    it { should validate_numericality_of(:celler) }
  end

  context '#calculate' do
    it 'adds all prices' do
      offer = Offer.new(distance: 10, living_space: 49, has_piano: true)

      expect(offer.calculate).to eq(7200)
    end

    it 'price for no piano' do
      offer = Offer.new(distance: 10, living_space: 49)

      expect(offer.calculate).to eq(2200)
    end

    it 'price for only distance' do
      offer = Offer.new(distance: 100)
      expect(offer.distance_price).to eq(10700)

      offer.distance = 99
      expect(offer.distance_price).to eq(5792)

      offer.distance = 51
      expect(offer.distance_price).to eq(5408)

      offer.distance = 49
      expect(offer.distance_price).to eq(1490)

      offer.distance = 10
      expect(offer.distance_price).to eq(1100)
    end

  end

  context '#volume_price' do
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
      expect(offer.volume_price).to eq(4400)
    end
  end
end
