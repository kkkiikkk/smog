class CommentsController < ApplicationController
  before_action :set_image, :set_category, only: %i[create]

  def create
    @comment = @image.comments.build(comment_params)
    @comment.user = current_user

    success = verify_recaptcha(action: 'add_comment', minimum_score: 0)
    checkbox_success = verify_recaptcha(model: @comment, site_key: '6Lc9DCMqAAAAACjwoZKeJA6OfIkohwD6FbkFgxpq') unless success
    Rails.logger.warn(checkbox_success)
    Rails.logger.warn(success)
    if checkbox_success || success
      @comment.save
        redirect_to category_image_path(@category, @image)
      # else
        # render json: { error: 'Error creating comment.' }, status: :unprocessable_entity
      # end 
    else
        if !success
          @show_checkbox_recaptcha = true
          Rails.logger.warn("Post not saved because of a recaptcha score of #{recaptcha_reply}")
       end
        # render :index, status: :unprocessable_entity
        render json: { error: 'Error creating comment.' }, status: :unprocessable_entity

    end
      
    end
  # end
  # end

  private

  def set_image
    @image = Image.find(params[:image_id])
  end

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def comment_params
    params.require(:comment).permit(:caption)
  end
end
