require 'rails_helper'

RSpec.describe 'geoapify API service' do
  describe 'connection' do
    it 'can connect to the places Geoapify API Service' do
      VCR.use_cassette('tourist_service') do
      tourist_sight_response = TouristSightService.tourist_sights('france')

      expect(tourist_sight_response).to be_a Hash
      expect(tourist_sight_response[:features]).to be_an Array
      end
    end
  end
end
