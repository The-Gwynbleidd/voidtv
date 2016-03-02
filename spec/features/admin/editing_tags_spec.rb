require "rails_helper"

RSpec.feature "Users can edit tags" do

  before do
    FactoryGirl.create(:tag, name: "Ancient Rome")
    login_as(FactoryGirl.create(:user, :admin))
    visit "/tags"
    click_link "Ancient Rome"
    click_link "Edit Tag"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Samurai"
    click_button "Update Tag"

    expect(page).to have_content "Tag has been updated."
    expect(page).to have_content "Samurai"
  end

  scenario "with invalid attributes" do
      fill_in "Name", with: ""
      click_button "Update Tag"

      expect(page).to have_content "Tag has not been updated."
      expect(page).to have_content "Name can't be blank"
  end

end
