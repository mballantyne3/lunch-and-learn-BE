class UserFavoritePoro
  def initialize(data)
    @id = data[:id]
    @type = "favorite"
    @attributes = {
      recipe_title: data[:recipe_title],
      recipe_link: data[:recipe_link],
      country: data[:country],
      created_at: data[:created_at]
    }
  end
end
