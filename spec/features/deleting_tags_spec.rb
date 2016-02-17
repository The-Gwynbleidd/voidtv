require "rails_helper"

RSpec.feature "Users can delete tag" do

  scenario "" do
    FactoryGirl.create(:tag, name:"Gladiators")

    visit "/tags"
    click_link "Gladiators"
    click_link "Delete Tag"

    expect(page).to have_content "Tag has been successfully deleted."
    expect(page.current_url).to eq tags_url
    expect(page).to have_no_content "Gladiators"
  end

end
