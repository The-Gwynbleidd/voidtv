class CountriesController < ApplicationController
  before_action :set_country, only:[:show, :edit, :update, :destroy]

  def index
    @countries = Country.all
  end

  def show
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      flash[:notice] = "Country has been created."
      redirect_to @country
    else
      flash.now[:alert] = "Country has not been created."
      render "new"
    end
  end

  def edit
  end

  def update
    if @country.update(country_params)
      flash[:notice] = "Country has been updated."
      redirect_to @country
    else
      flash.now[:alert] = "Country has not been updated."
      render "edit"
    end
  end

  def destroy
    @country.destroy
    flash[:notice] = "Country has been successfully deleted."
    redirect_to countries_path
  end

  private

    def country_params
      params.require(:country).permit(:name, :flag)
    end

    def set_country
      @country = Country.friendly.find(params['id'])
    end
end
