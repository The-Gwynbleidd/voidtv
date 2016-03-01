require "rails_helper"
RSpec.feature "Users can view networks" do
  scenario "with the network details" do
    network = FactoryGirl.create(:network, name: "HBO", bio: "Just another bio")
    visit "/"
    click_link "TV Networks"
    title = "TV Networks - VoidTV"
    expect(page).to have_title title

    click_link "HBO"
    title = "HBO - VoidTV"
    expect(page).to have_title title

    expect(page.current_url).to eq network_url(network)
  end
end
