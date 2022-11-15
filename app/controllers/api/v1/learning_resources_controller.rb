class Api::V1::LearningResourcesController < ApplicationController
  before_action  :set_country


  def index
    data = LearningResourcesFacade.resources_by_country(@country)
    # require 'pry'; binding.pry
    render json: LearningResourceSerializer.new(data)
  end

private

  def set_country
    if params[:country]
      @country = params[:country]
    else
      @country = CountriesFacade.random
    end
  end
end