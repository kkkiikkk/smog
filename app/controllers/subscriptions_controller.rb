class SubscriptionsController < ApplicationController
  before_action :set_category

  def create
    @subscription = @category.subscriptions.new(user: current_user)
    if @subscription.save
      redirect_to categories_path
    else
      render json: { error: 'Error subscribing' }, status: :unprocessable_entity
    end
  end

  def destroy
    Subscription.delete_by(id: params[:id])
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end
end
