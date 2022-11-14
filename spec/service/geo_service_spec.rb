require 'rails_helper'

RSpec.describe 'geoapify API service' do
  describe 'connection' do
    it 'can connect to the places Geoapify API Service' do
      geo_data = GeoService.tourist_sights(country)


    end
  end
end
