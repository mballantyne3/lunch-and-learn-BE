require 'rails_helper'

RSpec.describe 'REST country request' do
  it "returns the latitude and longitude of a country's capital city" do
    VCR.use_cassette('lat_long') do
    lat_long = CountryFacade.capital_lat_long('france')
    expect(lat_long).to eq([48.87, 2.33])
    end
  end

  it "returns a randomized country" do
    VCR.use_cassette('randomize_country') do

      @country = CountryFacade.randomize_country

      expect(@country).to be_a(String)
    end
  end
end
