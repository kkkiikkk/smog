class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.friendly.find(params[:id])
    @images = @category.images.page(params[:page]).per(5)
    return unless @category.nil?

    render json: { error: 'Category not found' }, status: :unprocessable_entity
  end
end
