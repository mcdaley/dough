#------------------------------------------------------------------------------
# app/views/api/v1/cars/index.json.builder
#------------------------------------------------------------------------------
json.header do
  json.code         200
  json.status       "OK"
  json.message      "Retrieved [#{@cars.length}] cars for user = [#{@user.id}]"
end

json.body do
  json.user_id      @user.id
  json.user_email   @user.email
  
  json.cars @cars do |car|
    json.id                 car.id
    json.make               car.make
    json.model              car.model
    json.year               car.year
    json.miles_per_gallon   car.miles_per_gallon
  end
end