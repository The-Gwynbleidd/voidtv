class TagsController < ApplicationController
  before_action :set_tag, only:[:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag has been created."
      redirect_to @tag
    else
      flash.now[:alert] = "Tag has not been created."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      flash[:notice] = "Tag has been updated."
      redirect_to @tag
    else
      flash.now[:alert] = "Tag has not been updated."
      render 'edit'
    end
  end

  def destroy
    @tag.destroy
    flash[:notice] = "Tag has been successfully deleted."
    redirect_to tags_path
  end

  private

    def tag_params
      params.require(:tag).permit(:name, :description)
    end

    def set_tag
      @tag = Tag.friendly.find(params['id'])
    end
end
