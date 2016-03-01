require "rails_helper"

RSpec.feature "Users can view actors" do

  scenario "with actor details" do
    actor = FactoryGirl.create(:actor, fullname: "Portia Doubleday")

    visit "/"
    click_link "Actors"

    title = "Actors - VoidTV"
    expect(page).to have_title title

    click_link "Portia Doubleday"

    title = "Portia Doubleday - VoidTV"
    expect(page).to have_title title

    expect(page.current_url).to eq actor_url(actor)
  end
end
