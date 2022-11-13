class RecipeFacade
  def self.recipes(country)
    return [] if country == ''
    country ||= CountryFacade.randomize_country #memoization: if the country is null, randomize it
    RecipeService.recipes(country)[:hits].map do |recipe_data|
      recipe_data[:recipe][:country] = country
      RecipePoro.new(recipe_data[:recipe])
    end
  end
end
