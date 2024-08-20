# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_request_url, only: %i[index show]
  after_action  :new_action, only: %i[index show]

  def index
    @categories = Category.left_joins(:subscriptions)
                          .select('categories.*, subscriptions.id AS subscription_id')
                          .where('subscriptions.user_id = ? OR subscriptions.id IS NULL', current_user.id)
                          .distinct
    @action_description = 'navigation'
  end

  def show
    @category = Category.friendly.find(params[:id])
    @images = @category.images.page(params[:page]).per(5)
    @action_description = 'navigation'
    return unless @category.nil?

    render json: { error: 'Category not found' }, status: :not_found_entity
  end

  private

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
