require 'rails_helper'

RSpec.describe 'recipe request' do
  describe 'happy path' do
    it 'returns a parsed recipe response for an existing country' do
      VCR.use_cassette('recipe_response') do
        get '/api/v1/recipes?country=thailand'

        expect(response).to be_successful

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response).to match data: an_instance_of(Array)
        #below test ensures the exact return FE is expecting with 'match'
        expect(parsed_response[:data]).to match a_collection_starting_with(
          {
            id: nil,
            type: "recipe",
            attributes: {
              title: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
              url: 'https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html',
              country: 'thailand',
              image: a_string_starting_with('https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg'),
            },
          },
          {
            id: nil,
            type: "recipe",
            attributes: {
              title: "THAI COCONUT CREMES",
              url: 'https://food52.com/recipes/37220-thai-coconut-cremes',
              country: 'thailand',
              image: a_string_starting_with('https://edamam-product-images.s3.amazonaws.com/web-img/8cd/8cd5ec2ff6310a088761956e4e571219.jpg'),
            },
          },
        )
      end
    end
  end

  it 'selects a random country when the user does not select one' do
    VCR.use_cassette('country_select') do
      allow(CountryFacade).to receive(:randomize_country).and_return('germany')

      get '/api/v1/recipes'

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(parsed_response[:data][0][:attributes][:country]).to eq('germany')
    end
  end

  describe 'sad path' do
    it 'returns an empty array if the country parameter is an empty string or the value does not have any recipes' do
      VCR.use_cassette('recipes_by_country') do
      get "/api/v1/recipes?country="

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data]).to eq []

      get '/api/v1/recipes?country=aieudhabsdfi'

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data]).to eq []
      end
    end
  end
end
