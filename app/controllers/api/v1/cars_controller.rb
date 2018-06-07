#------------------------------------------------------------------------------
# app/controllers//api/v1/cars_controller.rb
#------------------------------------------------------------------------------
class Api::V1::CarsController < ApiController
  before_action   :authenticate_user!

  def index
    @user = current_user
    @cars = @user.cars
  end

  def show
    begin
      @user = current_user
      @car  = @user.cars.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
      @error    = {name: error.class, code: 404, status: 'Not Found', message: error.message}
      log_error
      render    'error'
      return
    rescue Exception => error  
      logger.error("ERROR: #{error.message}")   
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
