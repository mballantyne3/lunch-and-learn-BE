require 'rails_helper'

RSpec.describe 'learning resources request' do
  describe 'happy path' do
    it 'returns learning resources for a specific country' do
      get '/api/v1/learning_resources?country=laos'

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to match data: an_instance_of(Array)
      expect(parsed_response[:data]).to match a_collection_starting_with
    end
  end
end
