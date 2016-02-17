require "rails_helper"

RSpec.feature "Users can edit ganres" do

  before do
    FactoryGirl.create(:ganre, name: "Adventure")
    visit "/ganres"
    click_link "Adventure"
    click_link "Edit Ganre"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Action"
    click_button "Update Ganre"

    expect(page).to have_content "Ganre has been updated."
    expect(page).to have_content "Action"
  end

  scenario "with invalid attributes" do
      fill_in "Name", with: ""
      click_button "Update Ganre"

      expect(page).to have_content "Ganre has not been updated."
      expect(page).to have_content "Name can't be blank"
  end

end
