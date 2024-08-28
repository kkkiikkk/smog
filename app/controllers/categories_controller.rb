# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_request_url, only: %i[index show]
  after_action  :new_action, only: %i[index show]

  def index
    @categories = Category.all
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
    return if current_user.nil?

    action_creator = ActionCreator.new(@action_description, @request_url, current_user.email)
    action_creator.create
    @action_description = nil
  end
end
