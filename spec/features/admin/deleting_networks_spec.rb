require "rails_helper"

RSpec.feature "Users can delete networks" do

  before do
    login_as(FactoryGirl.create(:user, :admin))
  end

  scenario "successfully" do

    FactoryGirl.create(:network, name: "ABC")

    visit "/networks"
    click_link "ABC"
    click_link "Delete Network"

    expect(page).to have_content "Network has been successfully deleted."
    expect(page.current_url).to eq networks_url
    expect(page).to have_no_content "ABC"

  end

end
