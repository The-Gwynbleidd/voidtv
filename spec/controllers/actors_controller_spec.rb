require 'rails_helper'

RSpec.describe ActorsController, type: :controller do
  it "handles a missing actor correctly" do

    get :show, id:"not-here"

    expect(response).to redirect_to(actors_path)
    message = "The actor you were looking for could not be found."
    expect(flash[:alert]).to eq message

  end
end
