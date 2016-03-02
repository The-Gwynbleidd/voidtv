require "rails_helper"

RSpec.feature "User can create network" do

  before do
    login_as(FactoryGirl.create(:user, :admin))
    visit '/admin'
    click_link "Add New Network"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "HBO"
    fill_in "Bio", with: "HBO (Home Box Office) is an American premium cable and
                          satellite television network that is owned by Home Box Office Inc.,
                          the cable flagship division of Time Warner. "
    attach_file('network[logo]', Rails.root + 'spec/fixtures/test.png')
    click_button "Create Network"

    # Then #
    expect(page).to have_content "Network has been created."
  end

  scenario "with invalid sttributes" do
    click_button "Create Network"
    expect(page).to have_content "Network has not been created."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Bio can't be blank"
  end

end
