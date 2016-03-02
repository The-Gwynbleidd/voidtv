class ActorsController < ApplicationController
  before_action :set_actor, only:[:show]

  def index
    @actors = Actor.all.order("fullname ASC")
  end

  def show
  end

  private

    def actor_params
      params.require(:actor).permit(:fullname, :bio, :image, :date_of_birth, :overview, :country_id, :gender)
    end

    def set_actor
      @actor = Actor.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The actor you were looking for could not be found."
      redirect_to actors_path
    end

end
