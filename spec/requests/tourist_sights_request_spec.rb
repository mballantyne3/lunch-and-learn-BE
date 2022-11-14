require 'rails_helper'

RSpec.describe 'GeoApify Request for Tourist Sights' do
  describe 'happy path' do
    it 'returns tourist sights of a given countries capital within a 20000 meter radius' do
      VCR.use_cassette('geo_request') do
        get '/api/v1/tourist_sights?country=France'

        expect(response).to be_successful

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response).to match data: an_instance_of(Array)
        expect(parsed_response[:data]).to match a_collection_starting_with(
          [
            {
              id: nil,
              type: "tourist_sight",
              attributes: {
                name: "Maison de Chateaubriand",
                address: "87 Rue de Chateaubriand, 92290 Châtenay-Malabry, France",
                place_id: "515d1f5d62721d024059cf1b831ae7624840f00102f901de515805000000009203174d6169736f6e2064652043686174656175627269616e64"
              }
            },
            {
              id: nil,
              type: "tourist_sight",
              attributes: {
                name: "Collège des Bernardins",
                address: "20 Rue de Poissy, 75005 Paris, France",
                place_id: "51f9513861f2d00240591ead34dda66c4840f00102f901f5a3950100000000920317436f6c6cc3a8676520646573204265726e617264696e73"
              }
            },
            {
              id: nil,
              type: "tourist_sight",
              attributes: {
                name: "Cimetière militaire américain",
                address: "Avenue du Professeur Léon Bernard, 92150 Suresnes, France",
                place_id: "511f9490d0a3bd014059808ad671a46f4840f00102f9013c601e020000000092031f43696d657469c3a87265206d696c69746169726520616dc3a972696361696e"
              },
            }
          ]
        )
      end
    end
  end
end
