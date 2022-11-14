require 'rails_helper'

RSpec.describe 'tourist sights poro' do
  it 'exists and has attributes' do
    data =
      {
        id: nil,
        type: 'tourist_sight',
        attributes: {
          name: "Maison de Chateaubriand",
          address: "87 Rue de Chateaubriand, 92290 Châtenay-Malabry, France",
          place_id: "515d1f5d62721d024059cf1b831ae7624840f00102f901de515805000000009203174d6169736f6e2064652043686174656175627269616e64"
        }
      }

    sight_results = TouristSightPoro.new(data)

    expect(sight_results).to be_a(TouristSightPoro)
    expect(sight_results[:attributes][:name]).to eq("Maison de Chateaubriand")
  end
end
