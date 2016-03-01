require "rails_helper"

RSpec.feature "Users can view tag" do
  scenario "with tag details" do
    tag = FactoryGirl.create(:tag, name: "Ancient Rome")

    visit "/"
    click_link "Tags"
    title = "Tags - VoidTV"
    expect(page).to have_title title

    click_link "Ancient Rome"
    title = "Ancient Rome - VoidTV"
    expect(page).to have_title title

    expect(page.current_url).to eq tag_url(tag)
  end
end
