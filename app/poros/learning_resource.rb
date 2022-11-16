class LearningResource
  attr_reader :id, :country

  def initialize(video, images, country)
    @id = "null"
    @country = country
    @video_data = video
    @image_data = images
  end

  def video
    {
      title: @video_data[:items].first[:snippet][:title],
      youtube_video_id: @video_data[:items].first[:id][:videoId]
    }
  end

  def images
    images = []
    @image_data.each do |image|
      images << { alt_tag: image[:description], url: image[:urls][:full] }
    end
    images
  end
end