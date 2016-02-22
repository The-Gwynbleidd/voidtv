require "rails_helper"

RSpec.feature "Users can create countries" do

  before do
    visit "/"
    click_link "Add New Country"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Serbia"
    attach_file("country[flag]", Rails.root + "spec/factories/serbia.png")
    click_button "Create Country"

    expect(page).to have_content "Country has been created."
  end

  scenario "with invalid attributes" do
    click_button "Create Country"

    expect(page).to have_content "Country has not been created."
    expect(page).to have_content "Name can't be blank"
  end
end
