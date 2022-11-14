class CountriesService
  def self.conn
    Faraday.new("https://restcountries.com")
  end


  def self.all
    response = conn.get("/v2/all?fields=name")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.details(country)
    response = conn.get("/v2/name/#{country}")
    JSON.parse(response.body, symbolize_names: true)
  end
end