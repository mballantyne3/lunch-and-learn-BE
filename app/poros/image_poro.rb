class ImagePoro
  attr_reader :alt_tag, :url

  def initialize(data)
    @url = data[:urls][:regular]
    @alt_tag = data[:alt_description]
  end
end
