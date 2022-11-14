class LearningResource
  def initialize(video, images, country)
    @id = "null"
    @country = country
    @video_data = video
    @image_data = images
  end

  def video
    {
      title: video_data[:items].first[:snippet][:title],
      youtube_id: video_data[:items].first[:id][:videoId]
    }
  end

  def images
    @image_data
    require 'pry'; binding.pry
  end
end