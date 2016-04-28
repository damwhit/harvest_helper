require "rails_helper"

RSpec.describe "GET api/v1/plants" do
  it "returns all plants" do
    plant1 = create(:plant)
    api_key = create(:api_key)

    get "/api/v1/plants/#{plant1.id}?api_key=#{api_key.api_key}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(18)

    expect(json_body[:name]).to eq(
      plant1.name,
      )

    put "/api/v1/plants/#{plant1.id}?api_key=#{api_key.api_key}&name=newname"

    expect(response.status).to eq(204)

    get "/api/v1/plants/#{plant1.id}?api_key=#{api_key.api_key}"

    expect(json_body.count).to eq(18)
    expect(json_body[:name]).to eq(
      "newname"
      )
  end
end
