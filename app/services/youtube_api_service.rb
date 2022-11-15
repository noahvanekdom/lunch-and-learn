class YoutubeApiService
  def self.conn
    Faraday.new("https://www.googleapis.com/youtube/v3/search") do |faraday|
      faraday.params['key'] = ENV['youtube_api_key']
    end
  end


  def self.video_by_country(country)

    response = conn.get do |faraday|
      faraday.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
      faraday.params['part'] = 'snippet'
      faraday.params['maxResults'] = 1
      faraday.params['q'] = country
      faraday.params['fields'] = 'items'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end