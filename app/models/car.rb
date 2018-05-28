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
end
