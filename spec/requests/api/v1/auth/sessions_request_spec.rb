#------------------------------------------------------------------------------
# spec/requests/api/v1/auth/sessions_controller_spec.rb
#------------------------------------------------------------------------------
require 'rails_helper'

RSpec.describe DeviseTokenAuth::SessionsController, type: :request do
  
  describe 'SessionsController' do
    let(:user) { FactoryBot.create(:user) }

    it 'Signs In' do
      login(user)
      expect(response.status).to eql(200)
    end
  end
end

#
# Helper to sign into the app
#
def login(user)
    post api_v1_user_session_path, 
      headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' },
      params:  {  email: user.email, password: user.password }.to_json
end