class NetworksController < ApplicationController
  before_action :set_network, only:[:show, :edit, :update, :destroy]

  def index
    @networks = Network.all
  end

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

  def edit
  end

  def update
    if @network.update(network_params)
      flash[:notice] = "Network has been updated."
      redirect_to @network
    else
      flash.now[:alert] = "Network has not been updated."
      render 'edit'
    end
  end

  def destroy
    @network.destroy
    flash[:notice] = "Network has been successfully deleted."
    redirect_to networks_path
  end


  private

    def network_params
      params.require(:network).permit(:name, :bio, :logo)
    end

    def set_network
      @network = Network.find(params['id'])
    end

end
