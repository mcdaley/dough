#------------------------------------------------------------------------------
# app/controllers//api/v1/cars_controller.rb
#------------------------------------------------------------------------------
class Api::V1::CarsController < ApiController

  def index
    #########################################################################
    # TODO: 06/04/2018
    # - HARDCODED USER UNTIL I GET THE DEVISE TOKEN AUTH WORKING
    #########################################################################
    ## @user = current_user
    @user = User.first
    @cars = @user.cars
  end

  def show
    begin
      #########################################################################
      # TODO: 06/04/2018
      # - HARDCODED USER UNTIL I GET THE DEVISE TOKEN AUTH WORKING
      #########################################################################
      ## @user = current_user
      @user = User.first
      @car  = @user.cars.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
      @error    = {name: error.class, code: 404, status: 'Not Found', message: error.message}
      log_error
      render    'error'
      return
    rescue Exception => error  
      logger.error("ERROR: #{e.message}")   
      ##puts e.backtrace.inspect
    end
  end
  
  #----------------------------------------------------------------------------
  # private
  #----------------------------------------------------------------------------
  private
    def log_error
      logger.error("ERROR: Caught exception [#{@error[:name]}]")
      logger.error(
        "ERROR: Code=[#{@error[:code]}], status=[#{@error[:status]}], message=[#{@error[:message]}]"
      )
    end

end # end of Api::V1::CarsController
