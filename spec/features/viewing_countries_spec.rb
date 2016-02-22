require "rails_helper"

RSpec.feature "Users can view countries" do
  scenario "with country details" do
    country = FactoryGirl.create(:country, name: "Australia")

    visit "/"
    click_link "Countries"
    click_link "Australia"

    expect(page.current_url).to eq country_url(country)
  end
end
