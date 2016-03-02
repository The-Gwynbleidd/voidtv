require "rails_helper"

RSpec.feature "Users can sign up" do

  scenario "with valid details" do
    visit "/"
    click_link "Sign up"

    fill_in "Email", with: "example@example.com"
    fill_in "user_password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_button "Sign up"

    expect(page).to have_content "You have signed up successfully."
  end

end
