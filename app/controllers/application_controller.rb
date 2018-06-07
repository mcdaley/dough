#------------------------------------------------------------------------------
# app/controllers/application_controller.rb
#------------------------------------------------------------------------------
class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  
  ##
  # For API requests we do not need to worry about rails generating CSRF key
  # as outlined in the following:
  #   https://github.com/lynndylanhurley/devise_token_auth/issues/398
  #
  protect_from_forgery  with: :null_session,
                        only: Proc.new { |c| c.request.format.json? }

end # end of ApplicationController
