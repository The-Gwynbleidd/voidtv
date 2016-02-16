require "rails_helper"
RSpec.feature "Users can view networks" do
  scenario "with the network details" do
    network = FactoryGirl.create(:network, name: "HBO", bio: "Just another bio")
    visit "/"
    click_link "TV Networks"
    click_link "HBO"
    expect(page.current_url).to eq network_url(network)
  end
end
