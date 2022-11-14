class LearningResourcesFacade
  def self.resources_by_country(country)
    video = YoutubeApiService.videos_by_country(country)
    images = UnsplashApiService.images_by_country(country)
    LearningResource.new(video_data, image_data, country)
  end
end