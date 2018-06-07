#------------------------------------------------------------------------------
# spec/requests/api/v1/auth/sessions_controller_spec.rb
#------------------------------------------------------------------------------
require 'rails_helper'

RSpec.describe DeviseTokenAuth::SessionsController, type: :request do
  
  # Sign In tests
  describe 'POST #create' do
    let(:user) { FactoryBot.create(:user) }

    describe 'confirmed user' do
      context 'with valid credentials' do
        it 'Signs In' do
          login(user.email, user.password)
          
          expect(response.status).to eq(200)
        end
      end # end of context 'with valid credentials'
      
      context 'with invalid email' do
        it 'rejects blanks email' do
          login('', user.password)
          json_response = JSON.parse(response.body)
          
          expect(response.status).to              eq(401)
          expect(json_response["errors"][0]).to   match(/Invalid login credentials/)
        end
        
        it 'rejects wrong email' do
          login('wrong@email.com', user.password)
          json_response = JSON.parse(response.body)
          
          expect(response.status).to              eq(401)
          expect(json_response["errors"][0]).to   match(/Invalid login credentials/)
        end
      end # end of context 'with invalid email'
      
      context 'with invalid password' do
        it 'rejects blank password' do
          login(user.email, '')
          json_response = JSON.parse(response.body)
          
          expect(response.status).to              eql(401)
          expect(json_response["errors"][0]).to   match(/Invalid login credentials/)
        end
        
        it 'rejects wrong password' do
          login(user.email, '')
          json_response = JSON.parse(response.body)
          
          expect(response.status).to              eql(401)
          expect(json_response["errors"][0]).to   match(/Invalid login credentials/)
        end
      end # end of context 'with invalid password'
      
    end # end of describe 'confirmed'
    
    describe 'unconfirmed user' do
      let(:unconfirmed_user) { FactoryBot.create(:unconfirmed_user) }
      
      it 'requires user to confirm account' do
        login(unconfirmed_user.email, unconfirmed_user.password)
        json_response = JSON.parse(response.body)
        
        expect(response.status).to                eq(401)
        expect(json_response["errors"][0]).to     match(/A confirmation email was sent/)
      end
    end # end of describe 'unconfirmed user'
  
  end # end of describe 'POST #create'
  
end # end of RSpec.describe DeviseTokenAuth::SessionsController

#
# Helper to sign into the app
#
def login(email, password)
    post api_v1_user_session_path, 
      headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' },
      params:  {  email: email, password: password }.to_json
end