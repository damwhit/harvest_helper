require 'rails_helper'

RSpec.feature "user can search for frost dates by zip" do
  context "a logged in user can search by zip" do
    before do
      @user = stub_omniauth
      @plant = create(:plant, name: "tomato")
    end

    VCR.use_cassette("zip_search") do
      it "can find frost dates by zip", js: true do
        visit '/plants'

        fill_in 'search', with: "tomato"
        find('input#search').native.send_keys(:return)

        expect(current_path).to eq(plant_path(@plant))

        expect(page).to_not have_content("Apr 18")
        expect(page).to_not have_content("Oct 18")

        fill_in 'zip', with: "46250"
        find('input#zip').native.send_keys(:return)

        expect(current_path).to eq(plant_path(@plant))

        expect(page).to have_content("Apr 18")
        expect(page).to have_content("Oct 18")
      end
    end
  end
end
