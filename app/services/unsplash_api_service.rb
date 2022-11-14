class UnsplashApiService

  def self.conn
    Faraday.new("https://api.unsplash.com/") do |faraday|
      faraday.params['client_id'] = ENV['unsplash_api_key']
    end
  end

  def self.images_by_country(country)
    response = conn.get("photos") do |faraday|
      faraday.params['query'] = country
      faraday.params['page'] = 1
      faraday.params['order_by'] = 'popular'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end