# frozen_string_literal: true

class CreateLikeCommand < Command
  def initialize(user, image, request_url)
    @user = user
    @image = image
    @request_url = request_url
  end

  def perform
    if expecting_like.nil?
      create_like
    else
      delete_like
    end
  end

  private

  def expecting_like
    @expecting_like ||= Like.find_by(user: @user, image: @image)
  end

  def create_like
    like = @image.likes.build(user: @user)
    if like.save
      create_action('likes')
    else
      false
    end
  end

  def delete_like
    expecting_like.destroy if expecting_like.present?
    create_action('likes')
  end

  def create_action(type)
    action_creator = ActionCreator.new(
      type,
      @request_url,
      @user.email
    )
    action_creator.create
  end
end
