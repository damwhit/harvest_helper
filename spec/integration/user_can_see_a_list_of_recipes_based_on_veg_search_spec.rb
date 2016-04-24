require 'rails_helper'

RSpec.feature "User sees a list of recipes for a given vegetable" do
  context "logged in user sees the recipes" do
    before do
      @user = stub_omniauth
      @plant = create(:plant, name: "carrot")
    end
    VCR.use_cassette("recipe_search") do
      it "returns a successful search", js: true do
        visit "/plants"
        fill_in "recipe_search", with: "carrot"
        find("input#recipe_search").native.send_keys(:return)



        expect(current_path).to eq('/recipes')

        link = "Deborah Madison's Ivory Carrot Soup with a Fine Dice of Orange Carrots"

        click_on(link)

        path = "/recipes/Deborah%20Madison's%20Ivory%20Carrot%20Soup%20with%20a%20Fine%20Dice%20of%20Orange%20Carrots"

        expect(current_path).to eq(path)
      end
    end
  end
end
