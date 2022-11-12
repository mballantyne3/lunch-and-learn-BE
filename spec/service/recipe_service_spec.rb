require 'rails_helper'

RSpec.describe 'Edamam Recipe Service' do

  describe 'connection' do
    it 'can connect to the Edamam Recipe Service' do
      recipe_data = RecipeService.recipes('thailand')

      expect(recipe_data).to be_a Hash
      expect(recipe_data[:hits]).to be_an Array
      expect(recipe_data[:hits][0][:recipe][:uri]).to be_a String
      expect(recipe_data[:hits][0][:recipe][:label]).to be_a String
      expect(recipe_data[:hits][0][:recipe][:image]).to be_a String
    end
  end
end
