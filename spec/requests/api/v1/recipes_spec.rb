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
    expect(plant1_json).to include({
      :id => "http://www.edamam.com/ontologies/edamam.owl#recipe_2e8370a36d9a9a9bc6304c390b8bd2d0",
      :name => "Carrot Halwa"
    })
  end
end
