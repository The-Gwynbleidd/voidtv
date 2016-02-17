require "rails_helper"

RSpec.feature "Users can view ganre" do
  scenario "with ganre details" do
    ganre = FactoryGirl.create(:ganre, name: "Action")

    visit "/"
    click_link "Ganres"
    click_link "Action"

    expect(page.current_url).to eq ganre_url(ganre)
  end
end
