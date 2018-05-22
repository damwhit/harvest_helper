require "rails_helper"
RSpec.feature "developer can get an api key" do
  context "a logged in user is able to get one key" do
    before do
      user = create(:user)
      sign_in user
      @api_key = create(:api_key)
    end

    it "should return a 16 digit key" do
      visit '/developers'

      click_on 'get api key'

      expect(current_path).to eq("/developers")

      expect(page).to have_content("your api key:")
      expect(page).to have_content("http://harvesthelper.herokuapp.com/api/v1/plants?api_key=YourApiKey")
    end

    it "should only allow one key per user" do
      visit '/developers'

      click_on 'get api key'

      expect(current_path).to eq("/developers")

      click_on 'get api key'

      expect(page).to have_content("only one key per dev.")
    end
  end
end
