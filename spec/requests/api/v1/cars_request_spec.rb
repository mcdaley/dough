#------------------------------------------------------------------------------
# spec/requests/api/v1/cars_requests_spec.rb
#------------------------------------------------------------------------------
require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :request do

  #############################################################################
  # TODO: 06/05/2018
  # - NEED TO THINK HOW I WANT TO ORGANIZE THE REQUEST SPECS
  # - REMOVE THE CONTROLLER SPECS FOR NOW AS THEY DO NOT WORK
  #############################################################################
  
  describe 'GET #index' do
    let( :user          ) { FactoryBot.create(:user_with_cars) }
    let( :token         ) { user.create_new_auth_token }
    let( :content_type  ) { { 'CONTENT_TYPE' => 'application/json', 
                              'ACCEPT'       => 'application/json' } }
    let( :headers       ) { content_type.merge!(token) }

    context 'when user is signed in' do
      describe 'valid request' do
        it 'returns http success' do
          get api_v1_cars_path, headers: headers
          expect(response.status).to                      eq(200)
        end
      
        it 'returns a token' do
          get api_v1_cars_path, headers: headers
        
          expect(response.has_header?('access-token')).to eq(true)
          expect(response.has_header?('client')).to       eq(true)
          expect(response.has_header?('expiry')).to       eq(true)
          expect(response.has_header?('token-type')).to   eq(true)
          expect(response.has_header?('uid')).to          eq(true)
        
          expect(response.headers['token-type']).to       eq('Bearer')
          expect(response.headers['uid']).to              eq(user.uid)
        end
      
        it 'returns an array of cars' do
          get api_v1_cars_path, headers: headers
        
          json_response = JSON.parse(response.body)
        
          expect(json_response["header"]["code"]).to      eq 200
          expect(json_response["body"]["cars"].length).to eq 1
        end
      end # end of describe 'valid request'
      
      describe 'invalid request' do
        # Change header access-token, uid, ...
      end # end of describe 'invalid request'
    end # end of context 'when user is signed in'
    
    #
    # Test Cases:
    # - Header has an invalid access-token, uid, client, token-type, ...
    # - User is not signed in (blank header)
    context 'when user is NOT signed in' do
    end # end of context 'when user is NOT signed in'
    
  end # end of describe 'GET #index'
  
=begin
  #
  # Test Cases:
  # - Invalid header tests (duplicate)
  # - User is not signed in
  # - User attempts to get car that does not belong to him
  # - User attempts to get car that does not exist
  #
  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
=end
  
end # end of RSpec.describe Api::V1::CarsController
