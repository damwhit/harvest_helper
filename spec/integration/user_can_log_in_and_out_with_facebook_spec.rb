require 'rails_helper'

RSpec.feature "UserLogsInWithFacebookAndLogsOut", type: :feature do
  before do
    @user = stub_omniauth
  end

  it "should redirect to homepage after logging out" do
    visit login_path
    expect(page.status_code).to eq(200)
    find("a#fb-logo").click
    expect(current_path).to eq(plants_path)
    expect(page).to have_content("Horace")
    find("#logout").click
    expect(page).to have_content("Come back soon")
  end
end
