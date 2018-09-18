require 'rails_helper'

RSpec.describe "GET /api/v1/plants" do
  it "returns a list of all plants" do
    include ApiHelpers
    plant1 = create(:plant)
    create(:plant, name: "test plant numero dos")
    api_key = create(:api_key)

    get "/api/v1/plants?api_key=#{api_key.api_key}"

    expect(response.status).to eq(200)
    plant1_json = json_body[0]
    expect(plant1_json).to eq({:id=>plant1.id,
      :name=>plant1.name,
      :description=>"oh so guud",
      :optimal_sun=>"full",
      :optimal_soil=>"loamy",
      :planting_considerations=>"lots of things to consider",
      :when_to_plant=>"spring",
      :growing_from_seed=>"do it",
      :transplanting=>"ok",
      :spacing=>"10-12 inches apart",
      :watering=>"lots",
      :feeding=> plant1.feeding,
      :other_care=>"weed and stoof",
      :diseases=>"yikes",
      :pests=>"bugs fa dayz",
      :harvesting=>"use ya hands",
      :storage_use=>"fridge fa days",
      :image_url => nil,
    })
  end
end
