class TagsController < ApplicationController
  before_action :set_tag, only:[:show]

  def index
    @tags = Tag.all
  end

  def show
  end
  
  private

    def tag_params
      params.require(:tag).permit(:name, :description)
    end

    def set_tag
      @tag = Tag.friendly.find(params['id'])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The tag you were looking for could not be found."
      redirect_to tags_path
    end
end
