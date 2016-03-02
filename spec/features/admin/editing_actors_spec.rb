require "rails_helper"

RSpec.feature "Users can edit actors" do

  before do
    FactoryGirl.create(:actor, fullname: "Emma Watson")
    login_as(FactoryGirl.create(:user, :admin))

    visit "/actors"
    click_link "Emma Watson"
    click_link "Edit Actor"
  end

  scenario "with valid attributes" do
    fill_in "Fullname", with: "New Emma"
    click_button "Update Actor"

    expect(page).to have_content "Actor has been updated."
    expect(page).to have_content "New Emma"
  end

  scenario "with invalid attributes" do
    fill_in "Fullname", with: ""
    click_button "Update Actor"

    expect(page).to have_content "Actor has not been updated."
    expect(page).to have_content "Fullname can't be blank"
  end

end
