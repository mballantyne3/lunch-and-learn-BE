class LearningResourceService

  def self.conn
    Faraday.new('https://youtube.googleapis.com') do |f|
      f.params['key'] = ENV.fetch('youtube_api_key', nil)
    end
  end

  def self.learning_resources(country)
    response = conn.get("/youtube/v3/search?part=snippet&q=Mr.%20History%20#{country}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
