require 'rails_helper'

RSpec.describe 'user' do
  describe 'create new user' do
    it 'can create a new user when given required params' do

      user_params = { name: 'Athena', email: 'supercoollady@gmail.com' }
      headers = { 'CONTENT-TYPE' => 'application/json' }

      post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)

      created_user = User.last

      expect(response).to be_successful
      expect(response).to have_http_status 201

      user_response = JSON.parse(response.body, symbolize_names: true)

      expect(user_response).to be_a Hash
    end
  end
end
