# frozen_string_literal: true

class ActionCreator
  def initialize(action_type, url, user_email)
    @action_type = action_type
    @url = url
    @user_email = user_email
  end

  def create
    action_time = calculate_action_time

    Action.create(email: @user_email, url: @url, action_type: @action_type, timestamp: action_time)
  end

  private

  def calculate_action_time
    time = Time.now
    adjusted_hours = time.hour + 24
    time.strftime('%d.%m.%Y ') + "#{adjusted_hours}:#{time.strftime('%M')}"
  end
end
