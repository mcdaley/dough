# == Schema Information
#
# Table name: cars
#
#  id               :bigint(8)        not null, primary key
#  make             :string
#  miles_per_gallon :integer
#  model            :string
#  year             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

#------------------------------------------------------------------------------
# spec/models/car_spec.rb
#------------------------------------------------------------------------------
require 'rails_helper'

RSpec.describe Car, :type => :model do
  let(:car) { FactoryBot.build(:car) }
  
  describe 'field validations' do
    # Shoulda matcher tests
    it { should validate_presence_of( :make  ) }
    it { should validate_presence_of( :model ) }
    
    # RSpec tests
    it 'requires a make' do
      expect( FactoryBot.build(:car, make: "")).to be_invalid
      expect( car ).to be_valid
    end
    
    it 'rejects a make that is too long' do
      expect( FactoryBot.build(:car, make: "x" * 65) ).to be_invalid
    end
  end
  
end # end of RSpec.describe Car
