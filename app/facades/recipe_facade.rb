class RecipeFacade

  def self.recipes(country)
    RecipeService.recipes(country)[:hits][0][:recipe].map do |recipe_data|
      Recipe.new(recipe_data)
    end
  end
end
