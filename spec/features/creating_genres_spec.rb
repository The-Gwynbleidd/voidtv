require "rails_helper"

RSpec.feature "Users can create genres" do

  before do
    login_as(FactoryGirl.create(:user, :admin))
    visit "/"
    click_link "Add New Genre"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Action"
    fill_in "Description", with:"Simple description"
    click_button "Create Genre"

    expect(page).to have_content "Genre has been created."

  end

  scenario "with invalid attributes" do
    click_button "Create Genre"

    expect(page).to have_content "Genre has not been created."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
end
