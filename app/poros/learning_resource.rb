class LearningResource
  attr_reader :id, :country

  def initialize(video, images, country)
    @id = "null"
    @country = country
    @video_data = video
    @image_data = images
  end

  def video
    # require 'pry'; binding.pry

    {
      title: @video_data[:items].first[:snippet][:title],
      youtube_id: @video_data[:items].first[:id][:videoId]
    }
  end

  def images
    @image_data
  end
end