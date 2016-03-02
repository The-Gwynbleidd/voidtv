class GenresController < ApplicationController
  before_action :set_genre, only:[:show]

  def index
    @genres = Genre.all
  end

  def show
  end

  private

    def genre_params
      params.require(:genre).permit(:name, :description)
    end

    def set_genre
      @genre = Genre.friendly.find(params['id'])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The genre you were looking for could not be found."
      redirect_to genres_path
    end
end
