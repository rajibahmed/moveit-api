require 'rails_helper'

RSpec.describe Offer, type: :model do
  context 'validations' do
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:distance) }
		it { should validate_numericality_of(:distance) }
		it { should validate_numericality_of(:attic) }
		it { should validate_numericality_of(:celler) }
  end
end
