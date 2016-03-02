class Admin::GenresController < Admin::ApplicationController
  before_action :set_genre, only:[:edit, :update, :destroy]

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "Genre has been created."
      redirect_to @genre
    else
      flash.now[:alert] = "Genre has not been created."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      flash[:notice] = "Genre has been updated."
      redirect_to @genre
    else
      flash.now[:alert] = "Genre has not been updated."
      render 'edit'
    end
  end

  def destroy
    @genre.destroy
    flash[:notice] = "Genre has been successfully deleted."
    redirect_to genres_path
  end

  private

    def genre_params
      params.require(:genre).permit(:name, :description)
    end

    def set_genre
      @genre = Genre.friendly.find(params['id'])
    end
end
