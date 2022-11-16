class ApplicationSerializer

  def self.no_recipe_returned
    { data: [] }
  end

  def self.favorite_creation
    { success: 'Favorite added successfully' }
  end
end