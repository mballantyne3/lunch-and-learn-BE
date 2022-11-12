class Recipe
  attr_reader :title, :type, :url, :country, :image_url
  def initialize(data)
    @title = data[0][:attributes][:label]
    @type = data[0][:type]
    @url = data[0][:attributes][:url]
    @country = data[0][:attributes][:country]
    @image_url = data[0][:attributes][:image]
  end
end
