require 'rails_helper'

RSpec.describe 'user' do
  describe 'create new user' do
    it 'can create a new user when given required params' do

      user_params = { name: 'Athena', email: 'supercoollady@gmail.com' }
      headers = { 'CONTENT-TYPE' => 'application/json' }

      post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)

      expect(response).to be_successful
      expect(response).to have_http_status 201

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_a Hash
      expect(parsed_response).to have_key :data
      expect(parsed_response[:data]).to have_key(:id)
      expect(parsed_response[:data]).to have_key(:type)

      expect(parsed_response[:data][:attributes]).to have_key(:name)
      expect(parsed_response[:data][:attributes][:name]).to be_a String

      expect(parsed_response[:data][:attributes]).to have_key(:email)
      expect(parsed_response[:data][:attributes][:email]).to be_a String

      expect(parsed_response[:data][:attributes]).to have_key(:api_key)
      expect(parsed_response[:data][:attributes][:api_key]).to be_a String
    end
  end

  describe 'sad path' do
    it 'gives an error message if an email address already exists upon user creation' do
      user_1_params = { name: 'Athena', email: 'supercoollady@gmail.com' }
      headers = { 'CONTENT-TYPE' => 'application/json' }

      post api_v1_users_path, headers: headers, params: JSON.generate(user: user_1_params)

      expect(response).to be_successful

      user_2_params = { name: 'Aphrodite', email: 'supercoollady@gmail.com' }
      headers = { 'CONTENT-TYPE' => 'application/json' }

      post api_v1_users_path, headers: headers, params: JSON.generate(user: user_2_params)

      expect(response).to have_http_status 422

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_a Hash
      expect(parsed_response[:email]).to eq(["has already been taken"])
    end
  end
end
