require "rails_helper"

RSpec.feature "Users can view genre" do
  scenario "with genre details" do
    genre = FactoryGirl.create(:genre, name: "Action")

    visit "/"
    click_link "Genres"
    title = "Genres - VoidTV"
    expect(page).to have_title title

    click_link "Action"
    title = "Action - VoidTV"
    expect(page).to have_title title


    expect(page.current_url).to eq genre_url(genre)
  end
end
