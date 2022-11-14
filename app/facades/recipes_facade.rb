class RecipesFacade
  def self.recipes_by_country(country)
    response = RecipesService.recipes_by_country(country)
    recipes = response[:hits]
    recipes.map do |recipe|
      Recipe.new(recipe, country)
    end
  end
end