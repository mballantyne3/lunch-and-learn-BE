class ImageFacade

  def self.images(country)
    ImageService.images(country)[:results].map do |data|
      ImagePoro.new(data)
    end
  end
end
