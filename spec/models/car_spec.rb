#------------------------------------------------------------------------------
# spec/models/car_spec.rb
#------------------------------------------------------------------------------

require 'rails_helper'

RSpec.describe Car, :type => :model do
  let(:car) { Car.new(make: 'Subaru', model: 'Forrester', miles_per_gallon: 25)}
  
  describe 'field validations' do
    it 'requires a make' do
      expect( Car.new(model: 'Forrester', miles_per_gallon: 25) ).to be_invalid
      expect( car ).to be_valid
    end
  end
  
end # end of RSpec.describe Car
