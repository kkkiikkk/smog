# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :set_category, :set_request_url
  after_action  :new_action, only: %i[create destroy]
  before_action :authenticate_user!
  

  def create
    @subscription = @category.subscriptions.new(user: current_user)
    if @subscription.save
      @action_description = 'subscribe'
      redirect_to categories_path
    else
      render json: { error: 'Error subscribing' }, status: :unprocessable_entity
    end
  end

  def destroy
    Subscription.delete_by(id: params[:id])
    @action_description = 'subscribe'
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_request_url
    @request_url = request.url
  end

  def new_action
    return if @action_description.nil?

    action_creator = ActionCreator.new(@action_description, @request_url, current_user.email)
    action_creator.create
    @action_description = nil
  end
end
