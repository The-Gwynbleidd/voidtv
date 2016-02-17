class GanresController < ApplicationController
  before_action :set_ganre, only:[:show, :edit, :update, :destroy]

  def index
    @ganres = Ganre.all
  end

  def show
  end

  def new
    @ganre = Ganre.new
  end

  def create
    @ganre = Ganre.new(ganre_params)
    if @ganre.save
      flash[:notice] = "Ganre has been created."
      redirect_to @ganre
    else
      flash.now[:alert] = "Ganre has not been created."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @ganre.update(ganre_params)
      flash[:notice] = "Ganre has been updated."
      redirect_to @ganre
    else
      flash.now[:alert] = "Ganre has not been updated."
      render 'edit'
    end
  end

  def destroy
    @ganre.destroy
    flash[:notice] = "Ganre has been successfully deleted."
    redirect_to ganres_path
  end

  private

    def ganre_params
      params.require(:ganre).permit(:name, :description)
    end

    def set_ganre
      @ganre = Ganre.friendly.find(params['id'])
    end
end
