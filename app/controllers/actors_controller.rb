class ActorsController < ApplicationController
  before_action :set_actor, only:[:show, :edit, :update, :destroy]

  def index
    @actors = Actor.all
  end

  def show
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      flash[:notice] = "Actor has been created."
      redirect_to @actor
    else
      flash.now[:alert] = "Actor has not been created."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @actor.update(actor_params)
      flash[:notice] = "Actor has been updated."
      redirect_to @actor
    else
      flash.now[:alert] = "Actor has not been updated."
      render 'edit'
    end

  end

  def destroy
    @actor.destroy
    flash[:notice] = "Actor has been successfully deleted."
    redirect_to actors_path
  end

  private

    def actor_params
      params.require(:actor).permit(:fullname, :bio, :image, :date_of_birth, :overview)
    end

    def set_actor
      @actor = Actor.friendly.find(params[:id])
    end

end
