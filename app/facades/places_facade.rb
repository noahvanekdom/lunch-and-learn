class PlacesFacade

  def self.tourist_sights(lat_long)
    response = PlacesService.tourist_sights(lat_long)
    require 'pry'; binding.pry
    sights_data = response[:features]
    sights_data.map do |sight_data|
      TouristSight.new(sight_data)
    end
  end
end