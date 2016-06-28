require 'rails_helper'

RSpec.describe "GET /api/v1/frost_dates" do
  it "returns a list of all frost_dates for a given plant" do
    include ApiHelpers
    api_key = create(:api_key)

    get "/api/v1/frost_dates?zip=80210&api_key=#{api_key.api_key}"

    expect(response.status).to eq(200)
    expect(json_body).to eq({
      :fall => "Sep 27",
      :spring => "May 17",
      })
  end
end
