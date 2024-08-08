class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def show
    @image = Image.find params[:id]
  end

  def create
    @image = Image.new post_params

    if @image.save
      redirect_to images_path
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:image).permit(:image)
  end
end
