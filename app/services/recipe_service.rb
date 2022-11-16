class RecipeService
  def self.conn
    Faraday.new(url: 'https://api.edamam.com') do |faraday|
      faraday.params['app_id'] = ENV['edemam_app_id']
      faraday.params['app_key'] = ENV['edemam_api_key']
    end
  end

  def self.recipes_by_country(country)
    response = conn.get("/search?q=#{country}")
    JSON.parse(response.body, symbolize_names: true)
  end
end