require 'rails_helper'

RSpec.describe GenresController, type: :controller do
  it "handles a missing genre correctly" do

    get :show, id:"not-here"

    expect(response).to redirect_to(genres_path)
    message = "The genre you were looking for could not be found."
    expect(flash[:alert]).to eq message

  end
end
