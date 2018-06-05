#------------------------------------------------------------------------------
# app/views/api/v1/cars/error.json.jbuilder
#------------------------------------------------------------------------------
json.header do
  json.code       @error[:code]
  json.status     @error[:status]
  json.message    @error[:message]
end

json.body         []