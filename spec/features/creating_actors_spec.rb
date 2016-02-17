require "rails_helper"

RSpec.feature "Users can create actors" do
  before do
    visit "/"
    click_link "Add New Actor"
  end

  scenario "with valid attributes" do
    fill_in "Fullname", with: "Emma Watson"
    fill_in "Bio", with: "Simple bio for Emma Watson"
    fill_in "Overview", with: "Simple overview"
    attach_file("actor[image]", Rails.root + 'spec/fixtures/emma.jpg')
    click_button "Create Actor"

    expect(page).to have_content "Actor has been created."

  end

  scenario "with valid attributes" do
    click_button "Create Actor"

    expect(page).to have_content "Actor has not been created."
    expect(page).to have_content "Fullname can't be blank"
  end

end
