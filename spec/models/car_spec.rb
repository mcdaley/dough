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
#  user_id          :bigint(8)
#

#------------------------------------------------------------------------------
# spec/models/car_spec.rb
#------------------------------------------------------------------------------
require 'rails_helper'

RSpec.describe Car, :type => :model do
  describe 'db columns' do
    it { should have_db_column( :id               ).of_type( :integer ) }
    it { should have_db_column( :make             ).of_type( :string  ) }
    it { should have_db_column( :model            ).of_type( :string  ) }
    it { should have_db_column( :year             ).of_type( :string  ) }
    it { should have_db_column( :miles_per_gallon ).of_type( :integer ) }
  end # end of describe 'db columns'
  
  describe 'relational schema' do
    it { should belong_to( :user ) }
  end # end of describe 'relational schema'
  
  describe 'validations' do
    ###########################################################################
    # TODO: 06/04/2018
    # - I'M GETTING AN ERROR THAT THE EMAIL IS ALREADY TAKEN UNLESS I ADD
    #   A DIFFERENT EMAIL IN THE USER FACTORY AND I'M NOT SURE WHY I AM
    #   GETTING THE ERROR.
    # - NOT SURE WHAT IS HAPPENING WHEN I BUILD A CAR IN THE SUBSEQUENT
    #   TESTS AS IT DOES NOT GET THE ERROR MESSAGE WHEN BUILDING A CAR
    ###########################################################################
    let(:user)  { FactoryBot.create( :user, email: 'validations@email.com' ) }
    let(:car)   { FactoryBot.build(  :car,  user:  user ) }
    
    describe 'verify car factory' do
      it 'creates a valid car' do
        expect( car                  ).to   be_valid
        expect( car.make             ).to   eql 'Subaru'
        expect( car.model            ).to   eql 'Forrester'
        expect( car.miles_per_gallon ).to   eql 25
      end
    end
  
    describe 'make' do
      it { should validate_presence_of( :make  ) }
      
      it 'requires a make' do
        expect( FactoryBot.build(:car, make: "")).to be_invalid
      end
  
      it 'rejects a make that is too long' do
        expect( FactoryBot.build(:car, make: "x" * 65) ).to be_invalid
      end
    end # end of describe 'make'

    describe 'model' do
      it { should validate_presence_of( :model ) }
      
      it 'requires a model' do
        expect( FactoryBot.build(:car, model: "")).to be_invalid
      end
  
      it 'rejects a model that is too long' do
        expect( FactoryBot.build(:car, model: "x" * 129) ).to be_invalid
      end
    end # end of describe 'model'
    
  end # end of describe 'validations'
  
end # end of RSpec.describe Car
