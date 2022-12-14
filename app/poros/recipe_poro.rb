class RecipePoro
  attr_reader :id, :type, :attributes, :title, :url, :country, :image

  def initialize(data)
    @id = nil
    @type = "recipe"
    @attributes = {
      title: data[:label],
      url: data[:url],
      country: data[:country],
      image: data[:image],
    }
  end
end
