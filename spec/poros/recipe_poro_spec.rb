require 'rails_helper'

RSpec.describe 'RecipePoro' do
  describe 'initialization' do
    it 'instantiates as a RecipePoro object' do
      recipe_data =
        {
            label: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
            url: 'https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html',
            country: 'thailand',
            image: 'https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg'
        }

      @recipe = RecipePoro.new(recipe_data)

      expect(@recipe).to be_a(RecipePoro)
      expect(@recipe.attributes[:title]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
      expect(@recipe.attributes[:url]).to eq('https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html')
      expect(@recipe.attributes[:country]).to eq('thailand')
      expect(@recipe.attributes[:image]).to eq('https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg')
    end
  end
end
