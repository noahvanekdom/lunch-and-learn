class PlacesFacade

  def self.tourist_sights(lat_long)
    response = PlacesService.tourist_sights(lat_long)
  end
end