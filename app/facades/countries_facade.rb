class CountriesFacade
  def self.random
    response = CountriesService.all
    response.pop[:name]
  end
end