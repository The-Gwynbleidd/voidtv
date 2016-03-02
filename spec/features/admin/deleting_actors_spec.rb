require "rails_helper"

RSpec.feature "Users can delete actors" do

  before do
    login_as(FactoryGirl.create(:user, :admin))
  end 

  scenario do
    FactoryGirl.create(:actor, fullname: "Emma Watson")
    visit "/actors"
    click_link "Emma Watson"
    click_link "Delete Actor"

    expect(page).to have_content "Actor has been successfully deleted."
    expect(page.current_url).to eq actors_url
    expect(page).to have_no_content "Emma Watson"
  end

end
