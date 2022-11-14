class VideoService

  def self.conn
    Faraday.new('https://youtube.googleapis.com') do |f|
      f.params['key'] = ENV.fetch('youtube_api_key')
    end
  end

  def self.videos(country)
    response = conn.get("/youtube/v3/search?part=snippet&q=Mr.%20History%20#{country}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
