class LikesController < ApplicationController
  before_action :set_image, :set_category

  def create
    expecting_like = Like.find_by(user: current_user, image: @image)

    if expecting_like.nil?
      @like = @image.likes.build
      @like.user = current_user
      if @like.save
        redirect_to category_image_path(@category, @image)
      else
        render json: { error: 'Error creating like.' }, status: :unprocessable_entity
      end
    else
      expecting_like.delete
      redirect_to category_image_path(@category, @image)
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
