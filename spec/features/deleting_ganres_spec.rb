require "rails_helper"

RSpec.feature "Users can delete ganres" do

  scenario "" do
    FactoryGirl.create(:ganre, name:"Fantasy")

    visit "/ganres"
    click_link "Fantasy"
    click_link "Delete Ganre"

    expect(page).to have_content "Ganre has been successfully deleted."
    expect(page.current_url).to eq ganres_url
    expect(page).to have_no_content "Fantasy"
  end

end
