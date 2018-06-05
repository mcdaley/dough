#------------------------------------------------------------------------------
# app/views/api/v1/cars/show.json.builder
#------------------------------------------------------------------------------
json.header do
  json.code         200
  json.status       "OK"
  json.message      "Retrieved the car with id = [#{@car.id}] for user = [#{@user.id}]"
end

json.body do
  json.user_id      @user.id
  json.user_email   @user.email
  
  json.car do
    json.id                 @car.id
    json.make               @car.make
    json.model              @car.model
    json.year               @car.year
    json.miles_per_gallon   @car.miles_per_gallon
  end
end