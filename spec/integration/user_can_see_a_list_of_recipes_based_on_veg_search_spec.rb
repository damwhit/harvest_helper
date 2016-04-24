require 'rails_helper'

RSpec.feature "User sees a list of recipes for a given vegetable" do
  context "logged in user sees the recipes" do
    before do
      @user = stub_omniauth
      @plant = create(:plant, name: "carrots")
    end
    VCR.use_cassette("recipe_search") do
      it "returns a successful search", js: true do
        visit "/plants"

        fill_in 'search', with: "#{@plant.name}"
        find('input#search').native.send_keys(:return)

        click_on "Lets cook some #{@plant.name}!"



        expect(current_path).to eq('/recipes')
        expect(page).to have_content("Carrot")

      end
    end
  end
end
