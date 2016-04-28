require "rails_helper"

RSpec.describe "POST api/v1/plants" do
  it "creates a new plant" do
    create(:plant)
    create(:plant, name: "thing")
    api_key = create(:api_key)

    post "/api/v1/plants?api_key=#{api_key.api_key}&name=canteloupe&description=guud&optimal_sun=full&optimal_soil=loamy&when_to_plant=now&growing_from_seed=ok&transplanting=aight&spacing=5in&watering=lots"

    expect(response.status).to eq(201)
    expect(json_body.count).to eq(18)

    get "/api/v1/plants?api_key=#{api_key.api_key}"

    expect(json_body.count).to eq(3)
    json_body4 = json_body[2]

    expect(json_body4[:name]).to eq("canteloupe")
    expect(json_body4[:description]).to eq("guud")

  end
end
