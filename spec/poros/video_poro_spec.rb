require 'rails_helper'

RSpec.describe 'Video Poro' do
  describe 'initialization' do
    it 'instantiates as a VideoPoro object' do
      video_data = {
        snippet: {
          title: "A Super Quick History of Laos" },
        id: {
          videoId: "uw8hjVqxMXw" }
      }

      @video = VideoPoro.new(video_data)

      expect(@video).to be_a(VideoPoro)
      expect(@video.title).to eq("A Super Quick History of Laos")
      expect(@video.youtube_video_id).to eq("uw8hjVqxMXw")
    end
  end
end
