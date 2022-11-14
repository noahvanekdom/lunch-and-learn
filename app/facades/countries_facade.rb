class CountriesFacade
  def self.random
    response = CountriesService.all
    response.pop[:name]
  end

  def self.country_details(country)
    response = CountriesService.details(country)
  end

  def self.lat_long(country)
    require 'pry'; binding.pry
    response = CountriesService.details(country).first[:latlng]
  end
end