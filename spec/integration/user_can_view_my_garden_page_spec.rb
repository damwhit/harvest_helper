  require 'rails_helper'

RSpec.feature "User views their 'my garden' page" do
  context "logged in user" do
    before do
      user = create(:user)
      @current_user = stub_current_user(user)
      @plant = create(:plant)
    end

    it "should see the plant that was searched for" do
      visit "/plants/#{@plant.id}"

      expect(page).to have_content("#{@plant.name}")

      click_on "add to my garden"

      visit '/mygarden'

      expect(current_path).to eq("/mygarden")

      expect(page).to have_content(@plant.name)
    end

    it "should not be able to add the same plant twice" do
      visit "/plants/#{@plant.id}"

      expect(page).to have_content("#{@plant.name}")

      click_on "add to my garden"
      expect(page).to have_content("#{@plant.name} added to garden!")

      click_on "add to my garden"
      expect(page).to have_content("heyyy that's already in your garden!")

    end
  end
end
