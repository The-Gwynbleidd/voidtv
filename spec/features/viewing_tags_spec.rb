require "rails_helper"

RSpec.feature "Users can view tag" do
  scenario "with tag details" do
    tag = FactoryGirl.create(:tag, name: "Ancient Rome")

    visit "/"
    click_link "Tags"
    click_link "Ancient Rome"

    expect(page.current_url).to eq tag_url(tag)
  end
end
