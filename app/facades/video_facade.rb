class VideoFacade

  def self.videos(country)
    VideoService.videos(country)[:items].map do |resource_data|
      VideoPoro.new(resource_data)
    end
  end
end
