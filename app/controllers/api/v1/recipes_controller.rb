class Api::V1::RecipesController < ApplicationController
  def index
    data = RecipesFacade.recipes_by_country(params[:country])
    render json: RecipeSerializer.new(data)
  end
end
