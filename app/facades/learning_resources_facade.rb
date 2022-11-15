class LearningResourcesFacade
  def self.resources_by_country(country)
    video = YoutubeApiService.video_by_country(country)
    images = UnsplashApiService.images_by_country(country)
    LearningResource.new(video, images, country)
  end
end