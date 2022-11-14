require 'rails_helper'

RSpec.describe 'learning resources request' do
  describe 'happy path' do
    it 'returns learning resources for a specific country' do
      get '/api/v1/learning_resources?country=laos'

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to match data: an_instance_of(Hash)
      expect(parsed_response[:data]).to match(
        {
          id: nil,
          type: "learning_resource",
          attributes: {
            country: "laos",
            video: {
              title: "A Super Quick History of Laos",
              youtube_video_id: "uw8hjVqxMXw"
            },
            images: [
              { alt_tag: "time lapse photography of flying hot air balloon", :url=>"https://images.unsplash.com/photo-1540611025311-01df3cef54b5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA0MzZ8MHwxfHNlYXJjaHwxfHxsYW9zfGVufDB8fHx8MTY2ODM4MzA1NA&ixlib=rb-4.0.3&q=80&w=1080"},
              { alt_tag: "aerial view of city at daytime", url: "https://images.unsplash.com/photo-1570366583862-f91883984fde?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA0MzZ8MHwxfHNlYXJjaHwyfHxsYW9zfGVufDB8fHx8MTY2ODM4MzA1NA&ixlib=rb-4.0.3&q=80&w=1080" },
              { alt_tag: "brown and white concrete building under blue sky during daytime", url: "https://images.unsplash.com/photo-1610426714962-83caa2244105?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA0MzZ8MHwxfHNlYXJjaHwzfHxsYW9zfGVufDB8fHx8MTY2ODM4MzA1NA&ixlib=rb-4.0.3&q=80&w=1080" },
              { alt_tag: "aerial view of green trees and mountains during daytime", url: "https://images.unsplash.com/photo-1593994602962-fc4c26fd82e9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA0MzZ8MHwxfHNlYXJjaHw0fHxsYW9zfGVufDB8fHx8MTY2ODM4MzA1NA&ixlib=rb-4.0.3&q=80&w=1080" },
              { alt_tag: "waterfalls in the middle of the forest during daytime", url: "https://images.unsplash.com/photo-1626982024771-282582a4ecac?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA0MzZ8MHwxfHNlYXJjaHw1fHxsYW9zfGVufDB8fHx8MTY2ODM4MzA1NA&ixlib=rb-4.0.3&q=80&w=1080" },
              { alt_tag: "two boats near body of water", url: "https://images.unsplash.com/photo-1441632260885-881646a7fd4d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA0MzZ8MHwxfHNlYXJjaHw2fHxsYW9zfGVufDB8fHx8MTY2ODM4MzA1NA&ixlib=rb-4.0.3&q=80&w=1080" },
              { alt_tag: "waterfalls on mountain", url: "https://images.unsplash.com/photo-1565092640981-0081b99f45ba?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA0MzZ8MHwxfHNlYXJjaHw3fHxsYW9zfGVufDB8fHx8MTY2ODM4MzA1NA&ixlib=rb-4.0.3&q=80&w=1080" },
              { alt_tag: "woman in red and white floral dress smiling", url: "https://images.unsplash.com/photo-1608000065495-0032a4e54f80?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA0MzZ8MHwxfHNlYXJjaHw4fHxsYW9zfGVufDB8fHx8MTY2ODM4MzA1NA&ixlib=rb-4.0.3&q=80&w=1080" },
              { alt_tag: "green trees near body of water during daytime", url: "https://images.unsplash.com/photo-1606064195579-a48c728cec35?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA0MzZ8MHwxfHNlYXJjaHw5fHxsYW9zfGVufDB8fHx8MTY2ODM4MzA1NA&ixlib=rb-4.0.3&q=80&w=1080" },
              { alt_tag: "body of water during sunset", url: "https://images.unsplash.com/photo-1553856622-d1b352e9a211?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA0MzZ8MHwxfHNlYXJjaHwxMHx8bGFvc3xlbnwwfHx8fDE2NjgzODMwNTQ&ixlib=rb-4.0.3&q=80&w=1080" },
            ]
          }
        }
      )
    end
  end

  describe 'sad path testing' do
    it 'returns an empty object if no video or image was found' do
      get '/api/v1/learning_resources?country=fjkdsloafjdilfjdskl'

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to have_key(:data)
      expect(parsed_response[:data]).to have_key(:attributes)
      expect(parsed_response[:data][:attributes][:images]).to eq([])
      expect(parsed_response[:data][:attributes][:video]).to eq([])
    end
  end
end
