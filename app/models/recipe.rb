class Recipe
  attr_reader :name,
              :image,
              :ingredients
  def initialize(data)
    @name = data[:recipe][:label]
    @image = data[:recipe][:image]
    @ingredients = data[:recipe][:ingredientLines]
  end

  def self.service
    EdamamService.new
  end

  def self.all(recipe_search)
    service.all(recipe_search)[:hits].map {
      |recipe| Recipe.new(recipe)
    }
  end
end
