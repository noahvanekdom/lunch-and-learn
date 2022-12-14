class Api::V1::RecipesController < ApplicationController
  before_action :find_country

  def index
    if @country == nil || @country == ""
      render json: ApplicationSerializer.no_recipe_returned
    else
      data = RecipesFacade.recipes_by_country(@country)
      render json: RecipeSerializer.new(data)
    end
  end

private

  def find_country
    if params[:country].nil?
      @country = CountriesFacade.random
    else
      @country = params[:country]
    end
  end
end
