class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.friendly.find(params[:id])

    return unless @category.nil?

    render json: { error: 'Category not found' }, status: :unprocessable_entity
  end
end
