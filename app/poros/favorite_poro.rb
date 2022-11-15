class FavoritePoro
  attr_reader :recipe_title, :recipe_link, :country

  def initialize(data)
    @recipe_link = data[:recipe_link]
    @recipe_title = data[:recipe_title]
    @country = data[:country]
  end
end
