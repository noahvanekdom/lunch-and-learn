class Api::V1::RecipesController < ApplicationController
  before_action :find_country

  def index
    data = RecipesFacade.recipes_by_country(@country)
    render json: RecipeSerializer.new(data)
  end

private

  def find_country
    if params[:country]
      @country = params[:country]
    else
      @country = CountriesFacade.random
    end
  end
end
