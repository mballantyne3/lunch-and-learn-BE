require 'rails_helper'

RSpec.describe 'learning resource service' do
  describe 'connection' do
    it 'can connect to the Youtube Service when given a country' do
      resource_data = VideoService.videos('laos')

      expect(resource_data).to be_a Hash
      expect(resource_data[:items]).to be_an Array

      expect(resource_data[:items][0][:id]).to have_key(:videoId)
      expect(resource_data[:items][0][:id][:videoId]).to be_a String

      expect(resource_data[:items][0][:snippet]).to have_key(:title)
      expect(resource_data[:items][0][:snippet][:title]).to be_a String
    end
  end
end
