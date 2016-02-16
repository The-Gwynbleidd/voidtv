require "rails_helper"

RSpec.feature "Users can edit networks" do

  before do
    FactoryGirl.create(:network, name: "HBO")

    visit "/networks"
    click_link "HBO"
    click_link "Edit Network"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Starz"
    click_button "Update Network"

    expect(page).to have_content "Network has been updated."
    expect(page).to have_content "Starz"

  end

  scenario "with invalid attributes" do

    # Act #
    fill_in "Name", with: ""
    click_button "Update Network"

    #then#
    expect(page).to have_content "Network has not been updated."
    expect(page).to have_content "Name can't be blank"
  end

end
