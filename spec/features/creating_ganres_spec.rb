require "rails_helper"

RSpec.feature "Users can create ganres" do

  before do
    visit "/"
    click_link "Add New Ganre"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Action"
    fill_in "Description", with:"Simple description"
    click_button "Create Ganre"

    expect(page).to have_content "Ganre has been created."

  end

  scenario "with invalid attributes" do
    click_button "Create Ganre"

    expect(page).to have_content "Ganre has not been created."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
end
