require 'rails_helper'

RSpec.describe 'GeoApify Request' do
  describe 'happy path' do
    it 'returns tourist sights of a given countries capital within a 20000 meter radius' do
      VCR.use_cassette('geo_request') do
        get '/api/v1/tourist_sights?country=France'

        expect(response).to be_successful

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response)
      end
    end
  end
end
