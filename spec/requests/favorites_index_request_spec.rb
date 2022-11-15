require 'rails_helper'

RSpec.describe 'Users Favorites Index Request' do
  before :each do
    @harry = User.create!(name: "Harry", email: "hogwarts4life@gmail.com")
    favorite_params_1 =
      {
        country: "thailand",
        recipe_link: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
        recipe_title: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)"
      }

    headers = { 'CONTENT-TYPE' => 'application/json' }

    post '/api/v1/favorites', headers: headers, params: JSON.generate(api_key: @harry.reload.api_key, favorite: favorite_params_1)
    expect(response).to be_successful

    favorite_params_2 =
      {
        country: "egypt",
        recipe_link: "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight",
        recipe_title: "Recipe: Egyptian Tomato Soup"
      }

    headers = { 'CONTENT-TYPE' => 'application/json' }

    post '/api/v1/favorites', headers: headers, params: JSON.generate(api_key: @harry.reload.api_key, favorite: favorite_params_2)
    expect(response).to be_successful
  end

  describe 'happy path' do
    it 'can return a list of a users favorites' do
      get "/api/v1/favorites?api_key=#{@harry.api_key}"

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to match data: an_instance_of(Array)
      expect(parsed_response[:data]).to contain_exactly(
        {
          id: an_instance_of(Integer),
          type: "favorite",
          attributes: {
            recipe_title: "Recipe: Egyptian Tomato Soup",
            recipe_link: "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight",
            country: "egypt",
            created_at: an_instance_of(String)
          }
        },
        {
          id: an_instance_of(Integer),
          type: "favorite",
          attributes: {
            recipe_title: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
            recipe_link: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
            country: "thailand",
            created_at: an_instance_of(String)
          },
        }
      )
    end
  end
end
