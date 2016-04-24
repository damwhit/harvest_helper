require 'rails_helper'

RSpec.feature "User sees a list of recipes for a given vegetable" do
  context "logged in user sees the recipes" do
    before do
      @user = stub_omniauth
      @plant = create(:plant, name: "carrot")
    end
      it "returns a successful search", js: true do
        visit "/plants"
        fill_in "recipe_search", with: "carrot"
        find("input#recipe_search").native.send_keys(:return)

        VCR.use_cassette("recipe_search") do


        expect(current_path).to eq('/recipes')
        expect(page).to have_content("Carrot")

      end
    end
  end
end
