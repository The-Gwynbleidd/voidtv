require "rails_helper"

RSpec.feature "Users can delete countries" do

  scenario "" do
    FactoryGirl.create(:country, name:"Serbia")
    login_as(FactoryGirl.create(:user, :admin))

    visit "/countries"
    click_link "Serbia"
    click_link "Delete Country"

    expect(page).to have_content "Country has been successfully deleted."
    expect(page.current_url).to eq countries_url
    expect(page).to have_no_content "Serbia"
  end

end
