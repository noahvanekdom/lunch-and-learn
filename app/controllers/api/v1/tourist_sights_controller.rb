class Api::V1::TouristSightsController < ApplicationController
  before_action :lat_long

  def index
    sights = PlacesFacade.tourist_sights(@lat_long)
    render json: TouristSightSerializer.new(data)
  end

private

  def lat_long
    if params[:country]
      @lat_long = CountriesFacade.lat_long(params[:country])
    else
      [nil, nil]
    end
  end
end