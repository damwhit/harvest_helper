require 'rails_helper'

RSpec.describe "GET /api/v1/recipes" do
  it "returns a list of all recipes for a given plant" do
    include ApiHelpers
    plant1 = create(:plant, name: 'carrot')
    create(:plant, name: "test plant numero dos")
    api_key = create(:api_key)

    get "/api/v1/recipes?plant=#{plant1.name}&api_key=#{api_key.api_key}"

    expect(response.status).to eq(200)
    plant1_json = json_body[0]
    expect(plant1_json).to eq({:id => "http://www.edamam.com/ontologies/edamam.owl#recipe_be5a134c776c528ff22c664552ccb69a",
      :image => "https://www.edamam.com/web-img/6d7/6d7c318d7a0e0b11413bbf5c4cc91583.jpg",
      :ingredients => ["8 medium carrots", "1 cup fresh carrot juice", "1/2 cup hoppy beer, such as a pilsner", "1 teaspoon sugar", "1 tablespoon unsalted butter", "Salt"],
      :name => "Carrots Braised in Beer and Carrot Juice",
      :servings => 4.0,
      :source => "Food & Wine",
      :sourceIcon => "http://www.foodandwine.com/favicon.ico",
      :tags => ["Vegetarian", "Egg-Free", "Peanut-Free", "Tree-Nut-Free", "Soy-Free", "Fish-Free", "Shellfish-Free"],
      :url => "http://www.foodandwine.com/recipes/carrots-braised-in-beer-and-carrot-juice"
    })
  end
end
