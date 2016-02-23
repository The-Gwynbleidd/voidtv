require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  it "handles a missing tag correctly" do

    get :show, id:"not-here"

    expect(response).to redirect_to(tags_path)
    message = "The tag you were looking for could not be found."
    expect(flash[:alert]).to eq message

  end
end
