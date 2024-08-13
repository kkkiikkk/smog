class LikesController < ApplicationController
  before_action :set_image, :set_category

  def create
    expecting_like = Like.find_by(user: current_user, image: @image)

    if expecting_like.nil?
      @like = @image.likes.build
      @like.user = current_user
      if @like.save
        time = Time.now
        adjusted_hours = time.hour + 24
        formatted_time = time.strftime('%d.%m.%Y ') + "#{adjusted_hours}:#{time.strftime('%M')}"
        Action.create(email: current_user.email, url: "/categories/#{@category.slug}/#{@image.id}/likes",
                      type: 'delete like',
                      timestamp: formatted_time)
        redirect_to category_image_path(@category, @image)
      else
        render json: { error: 'Error creating like.' }, status: :unprocessable_entity
      end
    else
      expecting_like.delete
      time = Time.now
      adjusted_hours = time.hour + 24
      formatted_time = time.strftime('%d.%m.%Y ') + "#{adjusted_hours}:#{time.strftime('%M')}"
      Action.create(email: current_user.email, url: "/categories/#{@category.slug}/#{@image.id}/likes",
                    type: 'delete like',
                    timestamp: formatted_time)
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
