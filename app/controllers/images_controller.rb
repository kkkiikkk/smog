class ImagesController < ApplicationController
  before_action :set_category, only: %i[show]

  def index
    @images = Image.includes(:category).where.not(category_id: nil).page(params[:page]).per(20)
  end

  def new
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
  end

  def create
    @category = Category.find_or_create_by(name: category_name_param)
    @image = @category.images.new(image_params)

    if @image.save
      redirect_to category_image_path(@category, @image)
    else
      render 'new'
    end
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end

  def category_name_param
    params.require(:image).permit(:category_name)[:category_name]
  end

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end
end
