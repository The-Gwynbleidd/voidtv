class NetworksController < ApplicationController
  before_action :set_network, only:[:show]

  def index
    @networks = Network.paginate(:page => params[:page], :per_page => 30).order("name ASC")
  end

  def show

  end
  
  private

    def network_params
      params.require(:network).permit(:name, :bio, :overview, :logo, :country_id)
    end

    def set_network
      @network = Network.friendly.find(params['id'])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The network you were looking for could not be found."
      redirect_to networks_path
    end

end
