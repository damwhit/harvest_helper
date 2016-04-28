class Recipe
  attr_reader :name,
              :image,
              :ingredients,
              :id,
              :servings,
              :tags,
              :url,
              :source,
              :sourceIcon

  def initialize(data)
    @name = data[:label]
    @image = data[:image]
    @ingredients = data[:ingredientLines]
    @id = data[:uri]
    @servings = data[:yield]
    @tags = data[:healthLabels]
    @url = data[:url]
    @source = data[:source]
    @sourceIcon = data[:sourceIcon]
  end

  def self.service
    EdamamService.new
  end

  def self.all(plant)
    service.all(plant)[:hits].map { |data|
      Recipe.new(data[:recipe])
    }
  end

  def self.find(id)
    Recipe.new(service.find(id).first)
  end
end
