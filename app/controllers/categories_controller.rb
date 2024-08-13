class CategoriesController < ApplicationController
  def index
    @categories = Category.left_joins(:subscriptions)
                          .select('categories.*, subscriptions.id AS subscription_id')
                          .where('subscriptions.user_id = ? OR subscriptions.id IS NULL', current_user.id)
                          .distinct

    p @categories
  end

  def show
    @category = Category.friendly.find(params[:id])
    @images = @category.images.page(params[:page]).per(5)
    return unless @category.nil?

    render json: { error: 'Category not found' }, status: :unprocessable_entity
  end
end
