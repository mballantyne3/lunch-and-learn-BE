require 'rails_helper'

RSpec.describe 'User Favorites Request' do
  before :each do
    user_params = { name: 'Aries', email: 'randomemail@gmail.com' }
    headers = { 'CONTENT-TYPE' => 'application/json' }

    post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)

    @aries = User.last
  end

  describe 'happy path' do
    describe 'post to user favorites' do
      it 'can post to a users favorite recipes index' do
        VCR.use_cassette('favorite_recipe') do
        favorite_params = {
          api_key: @aries.api_key,
          country: "thailand",
          recipe_link: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
          recipe_title: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)"}

        headers = { 'CONTENT-TYPE' => 'application/json'}

        post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite: favorite_params)

        expect(response).to be_successful
        end
      end
    end
  end
end
