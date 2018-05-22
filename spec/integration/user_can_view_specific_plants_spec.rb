require 'rails_helper'

RSpec.feature "User sees a specific plant" do
  context "logged in user, when searching", :js => true do
    before do
      @user = create(:user)
      @plant = create(:plant)
    end

    it "should see the plant that was searched for" do

      visit '/plants'

      fill_in 'search', with: "#{@plant.name}"

      find('input#search').native.send_keys(:return)

      expect(current_path).to eq("/plants/#{@plant.id}")
      expect(page).to have_content("#{@plant.name}")

    end

    it "should see render index if plant doesn't exist." do

      visit '/plants'

      fill_in 'search', with: "poop"

      find('input#search').native.send_keys(:return)

      expect(current_path).to eq("/plants")
      expect(page).to have_content("Sorry, couldn't find that plant. Search again.
")
    end
  end
end
