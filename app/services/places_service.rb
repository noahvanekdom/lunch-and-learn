class PlacesService

  def self.conn
    Faraday.new("https://api.geoapify.com/v2") do |faraday|
      faraday.params['apiKey'] = ENV['geoapify_api_key']
    end
  end

  def self.tourist_sights(lat_long)
    conn.get("/places") do |faraday|
      faraday.params['categories'] = 'tourism.sights'
      faraday.params['filter'] = ["circle:#{lat_long[1]},#{lat_long[0]},20000"]
    end
  end
end