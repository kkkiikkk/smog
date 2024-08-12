class SubscriptionsController < ApplicationController
  before_action :set_category

  def create
    @subscription = @category.subscriptions.new(user_id: current_user.id)

    redirect_to categories_path
  end


  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end
end
