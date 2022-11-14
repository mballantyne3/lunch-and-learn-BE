class ImageService

  def self.conn
    image_access_key = ENV.fetch('image_access_key')
    Faraday.new('https://api.unsplash.com') do |f|
      f.headers['Authorization'] = "Client-ID #{image_access_key}"
    end
  end

  def self.images(country)
    response = conn.get("/search/photos", query: country)
    JSON.parse(response.body, symbolize_names: true)
  end
end
