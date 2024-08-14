# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_image, :set_category

  def create
    create_like_command = CreateLikeCommand.new(current_user, @image, @category, request.url)

    if create_like_command.perform
      redirect_to category_image_path(@category, @image)
    else
      render json: { error: 'Error creating like' }, status: :unprocessable_entity
    end
  end

  private

  def set_image
    @image = Image.find(params[:image_id])
  end

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end
end
