require 'rails_helper'

RSpec.describe CountriesController, type: :controller do
  it "handles a missing country correctly" do

    get :show, id:"not-here"

    expect(response).to redirect_to(countries_path)
    message = "The country you were looking for could not be found."
    expect(flash[:alert]).to eq message

  end
end
