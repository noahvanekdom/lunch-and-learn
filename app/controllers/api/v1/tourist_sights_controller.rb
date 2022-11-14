class Api::V1::TouristSightsController < ApplicationController
  before_action :set_country, :lat_long

  def index
    sights = PlacesFacade.tourist_sights(@lat_long)
    render json: TouristSightSerializer.new(sights)
  end

private

  def set_country
    if params[:country]
      @country = params[:country]
    else
      @country = CountriesFacade.random
    end
  end

  def lat_long
    @lat_long = CountriesFacade.lat_long(@country)
  end
end