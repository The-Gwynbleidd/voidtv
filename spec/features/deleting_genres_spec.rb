require "rails_helper"

RSpec.feature "Users can delete genres" do

  scenario "" do
    FactoryGirl.create(:genre, name:"Fantasy")

    visit "/genres"
    click_link "Fantasy"
    click_link "Delete Genre"

    expect(page).to have_content "Genre has been successfully deleted."
    expect(page.current_url).to eq genres_url
    expect(page).to have_no_content "Fantasy"
  end

end
