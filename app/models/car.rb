#------------------------------------------------------------------------------
# app/models/car.rb
#------------------------------------------------------------------------------
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

class Car < ApplicationRecord
  belongs_to  :user
  
  validates   :make,              presence: true, length: {in: 1..64}
  validates   :model,             presence: true, length: {in: 1..128} 
  validates   :miles_per_gallon,  numericality: { only_integer: true }
end
