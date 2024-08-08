class CommentsController < ApplicationController
  before_action :set_image, only: %i[create index]

  def create
    @comment = @image.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @image
    else
      render json: { error: 'Error creating comment.' }, status: :unprocessable_entity
    end
  end

  private

  def set_image
    @image = Image.find(params[:image_id])
  end

  def comment_params
    params.require(:comment).permit(:caption)
  end
end
