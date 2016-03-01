require "rails_helper"

RSpec.feature "Users can view countries" do
  scenario "with country details" do
    country = FactoryGirl.create(:country, name: "Australia")

    visit "/"
    click_link "Countries"

    title = "Countries - VoidTV"
    expect(page).to have_title title

    click_link "Australia"

    title = "Australia - VoidTV"
    expect(page).to have_title title

    expect(page.current_url).to eq country_url(country)
  end
end
