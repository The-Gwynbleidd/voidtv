require "rails_helper"

RSpec.feature "Users can edit genres" do

  before do
    FactoryGirl.create(:genre, name: "Adventure")
    visit "/genres"
    click_link "Adventure"
    click_link "Edit Genre"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Action"
    click_button "Update Genre"

    expect(page).to have_content "Genre has been updated."
    expect(page).to have_content "Action"
  end

  scenario "with invalid attributes" do
      fill_in "Name", with: ""
      click_button "Update Genre"

      expect(page).to have_content "Genre has not been updated."
      expect(page).to have_content "Name can't be blank"
  end

end
