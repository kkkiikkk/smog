# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_image, :set_request_url, :authenticate_user!, :set_category, only: [:create]
  after_action  :new_action, only: %i[create]

  def create
    @comment = @image.comments.build(comment_params)
    @comment.user = current_user
    @action_description = 'comments'
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
