class CommentsController < ApplicationController
  before_action :set_image, :set_category, only: [:create]

  def create
    @comment = @image.comments.build(comment_params)
    @comment.user = current_user

    recaptcha_success = verify_recaptcha(model: @comment)

    if recaptcha_success && @comment.save
      redirect_to category_image_path(@category, @image), notice: 'Comment successfully created.'
    else
      @show_checkbox_recaptcha = true unless recaptcha_success
      render json: { error: 'Error creating comment or reCAPTCHA failed.' }, status: :unprocessable_entity
    end
  end

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
