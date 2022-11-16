class CountriesFacade
  def self.random
    response = CountriesService.all
    response.sample[:name]
  end

  # def self.country_details(country)
  #   response = CountriesService.details(country)
  # end

  def self.lat_long(country)
    response = CountriesService.details(country).first[:latlng]
  end
end