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

class Car < ApplicationRecord
  validates :make,              length: {2..64},  presence: true
  validates :model,             length: {2..128}, presence: true
  validates :miles_per_gallon,  numericality: { only_integer: true }
end
