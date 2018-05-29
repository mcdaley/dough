#------------------------------------------------------------------------------
# spec/factories/factories.rb
#------------------------------------------------------------------------------

FactoryBot.define do
  # Car model
  factory :car, class: Car do |f|
    f.make                "Subaru"
    f.model               "Forrester"
    f.miles_per_gallon    25
  end # end of factory :car, class Car
  
end # end of FactoryBot.define