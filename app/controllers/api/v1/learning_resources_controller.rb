class Api::V1::LearningResourcesController < ApplicationController
  before_action  :set_country


  def index
    data = LearningResourcesFacade.resources_by_country(@country)
    render json: LearningResourceSerializer.new(data)
  end

private

  def set_country
    if params[:country].nil?
      @country = CountriesFacade.random
    else
      @country = params[:country]
    end
  end
end