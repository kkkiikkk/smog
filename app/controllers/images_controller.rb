# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :set_category, only: %i[show]
  after_action :new_action, only: %i[index create show]

  def index
    @images = Image.includes(:category).where.not(category_id: nil).page(params[:page]).per(20)
    @action_description = 'navigation'
  end

  def new
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
    @action_description = 'navigation'
  end

  def create
    @category = Category.find_or_create_by(name: category_name_param)
    @image = @category.images.new(image_params)
    SubscriptionsJob.perform_now(@image, @category)
    if @image.save
      @action_description = 'image'
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

  def new_action
    return if @action_description.nil?

    action_creator = ActionCreator.new(@action_description, request.url, current_user.email)
    action_creator.create
    @action_description = nil
  end
end
