class ImagesController < ApplicationController
  before_action :set_category, only: %i[show index]

  def index
    @images = Image.includes(:category).where.not(category_id: nil)
  end

  def new
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(post_params)

    if @image.save
      redirect_to category_image_path(@category, @image)
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:image).permit(:image)
  end

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end
end
