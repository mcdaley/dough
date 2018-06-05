#------------------------------------------------------------------------------
# app/controllers/api_controller.rb
#------------------------------------------------------------------------------
class ApiController < ApplicationController
  before_action   :set_default_format
  
  #----------------------------------------------------------------------------
  # private methods
  #----------------------------------------------------------------------------
  private
  
    ##
    # Return json documents for all api requests
    #
    def set_default_format
      request.format = :json
    end
  
end # end of class ApiController