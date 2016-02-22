require "rails_helper"

RSpec.feature "Users can edit countries" do

  before do
    FactoryGirl.create(:country, name: "Serbia")

    visit "/countries"
    click_link "Serbia"
    click_link "Edit Country"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "New Serbia"
    click_button "Update Country"

    expect(page).to have_content "Country has been updated."
    expect(page).to have_content "New Serbia"
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Country"

    expect(page).to have_content "Country has not been updated."
    expect(page).to have_content "Name can't be blank"
  end

end
