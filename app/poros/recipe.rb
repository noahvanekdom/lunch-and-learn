class Recipe
  attr_reader :id, :title, :url, :image, :country

  def initialize(data, country)
    @id = "null"
    @title = data[:recipe][:label]
    @url = data[:recipe][:url]
    @image = data[:recipe][:image]
    @country = country
  end
end