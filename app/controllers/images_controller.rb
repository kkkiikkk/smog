class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find params[:id]
  end

  def new
    # puts params
    # puts post_params

    @image = Image.new
  end

  def create
    # puts params
    # puts post_params
    @image = Image.new post_params

    if @image.save
      redirect_to @image
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:image).permit(:image)
  end
end
