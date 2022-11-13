class RecipeFacade
  def self.recipes(country)
    RecipeService.recipes(country)[:hits].map do |recipe_data|
      recipe_data[:recipe][:country] = country
      RecipePoro.new(recipe_data[:recipe])
    end
  end
end
