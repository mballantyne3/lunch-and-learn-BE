require 'rails_helper'

RSpec.describe 'REST Countries API' do
  describe 'connection' do
    it 'can connect to the countries API and return a country based on name' do
      country_data = CountryService.get_country('thailand')

      expect(country_data).to be_an Array
      expect(country_data[0]).to be_a Hash
      expect(country_data[0][:name][:common]).to eq("Thailand")
      expect(country_data[0][:name]).to have_key(:common)
      expect(country_data[0][:name]).to have_key(:official)
    end

    it 'can return all countries' do
      all_countries_data = CountryService.get_all_countries

      expect(all_countries_data).to be_an Array
      expect(all_countries_data[0]).to be_a Hash
      expect(all_countries_data[0][:name]).to be_a Hash
      expect(all_countries_data[0]).to have_key(:name)
    end
  end
end
