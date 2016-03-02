class CountriesController < ApplicationController
  before_action :set_country, only:[:show]

  def index
    @countries = Country.all
  end

  def show
  end

  private

    def country_params
      params.require(:country).permit(:name, :flag)
    end

    def set_country
      @country = Country.friendly.find(params['id'])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The country you were looking for could not be found."
      redirect_to countries_path
    end
end
