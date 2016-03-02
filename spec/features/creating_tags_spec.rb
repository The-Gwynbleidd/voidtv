require "rails_helper"

RSpec.feature "Users can create tags" do
  before do
    login_as(FactoryGirl.create(:user, :admin))
    visit "/"
    click_link "Add New Tag"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Ancient Rome"
    fill_in "Description", with: "TV shows about ancient rome."
    click_button "Create Tag"

    expect(page).to have_content "Tag has been created."
  end

  scenario "with invalid attributes" do
    click_button "Create Tag"

    expect(page).to have_content "Tag has not been created."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

end
