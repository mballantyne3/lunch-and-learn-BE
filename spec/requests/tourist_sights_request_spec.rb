require 'rails_helper'

RSpec.describe 'GeoApify Request for Tourist Sights' do
  describe 'happy path' do
    xit 'returns tourist sights of a given countries capital within a 20000 meter radius' do
      VCR.use_cassette('geo_request') do
        get '/api/v1/tourist_sights?country=France'

        expect(response).to be_successful

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response).to match data: an_instance_of(Array)
        expect(parsed_response[:data]).to match(
          [
            {
              id: null,
              type: "tourist_sight",
              attributes: {
                name: "Tour de l'horloge",
                address: "Tour de l'horloge, Allée de l'Horloge, 23200 Aubusson, France",
                place_id: "51d28..."
              }
            },
            {
              id: null,
              type: "tourist_sight",
              attributes: {
                name: "Le Château",
                address: "Le Château, D 18, 23150 Ahun, France",
                place_id: "51934..."
              }
            },
            {
              id: null,
              type: "tourist_sight",
              attributes: {
                name: "Le Chapître",
                address: "Le Chapître, Rue du Chapitre, 23200 Aubusson, France",
                place_id: "517182..."
              },
            }
          ]
        )
      end
    end
  end
end
