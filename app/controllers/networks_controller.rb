class NetworksController < ApplicationController
  before_action :set_network, only:[:show]

  def show

  end

  def new
    @network = Network.new
  end

  def create
    @network = Network.new(network_params)
    if @network.save
      flash[:notice] = "Network has been created."
      redirect_to @network
    else
      flash.now[:alert] = "Network has not been created."
      render 'new'
    end
  end

  private

    def network_params
      params.require(:network).permit(:name, :bio, :logo)
    end

    def set_network
      @network = Network.find(params['id'])
    end

end
