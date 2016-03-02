class Admin::NetworksController < Admin::ApplicationController
  before_action :set_network, only:[:edit, :update, :destroy]

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
      params.require(:network).permit(:name, :bio, :overview, :logo, :country_id)
    end

    def set_network
      @network = Network.friendly.find(params['id'])
    end
end
