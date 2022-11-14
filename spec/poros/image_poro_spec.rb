require 'rails_helper'

RSpec.describe 'ImagePoro' do
  describe 'initialization' do
    it 'instantiates as an ImagePoro object' do
      image_data = {
        alt_description: "time lapse photography of flying hot air balloon",
        urls: {
          regular: "https://images.unsplash.com/photo-1540611025311-01df3cef54b5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA0MzZ8MHwxfHNlYXJjaHwxfHxsYW9zfGVufDB8fHx8MTY2ODM4MzA1NA&ixlib=rb-4.0.3&q=80&w=1080"
        }
      }

      @image = ImagePoro.new(image_data)

      expect(@image).to be_a(ImagePoro)
      expect(@image.url).to eq("https://images.unsplash.com/photo-1540611025311-01df3cef54b5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA0MzZ8MHwxfHNlYXJjaHwxfHxsYW9zfGVufDB8fHx8MTY2ODM4MzA1NA&ixlib=rb-4.0.3&q=80&w=1080")
      expect(@image.alt_tag).to eq("time lapse photography of flying hot air balloon")
    end
  end
end
