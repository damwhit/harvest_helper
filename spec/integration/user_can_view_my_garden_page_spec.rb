  require 'rails_helper'

RSpec.feature "User views their 'my garden' page" do
  context "logged in user" do
    before do
      @user = stub_omniauth
      @plant = create(:plant)
    end

    it "should see the plant that was searched for" do

      visit '/plants'

      fill_in 'search', with: "#{@plant.name}"

      find('input#search').native.send_keys(:return)

      expect(current_path).to eq("/plants/#{@plant.id}")
      expect(page).to have_content("#{@plant.name}")

      click_on "add to my garden"

      click_on "my garden"

      expect(current_path).to eq("garden/users/#{@user.id}")

      expect(page).to have_content(@plant.name)
    end
  end
end
