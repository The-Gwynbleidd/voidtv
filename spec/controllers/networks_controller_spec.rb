require 'rails_helper'

RSpec.describe NetworksController, type: :controller do
  it "handles a missing network correctly" do

    get :show, id:"not-here"

    expect(response).to redirect_to(networks_path)
    message = "The network you were looking for could not be found."
    expect(flash[:alert]).to eq message

  end
end
