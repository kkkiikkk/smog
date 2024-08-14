class ActionCreator
  def initialize(type, url, user_email)
    @type = type
    @url = url
    @user_email = user_email
  end

  def create
    action_time = calculate_action_time

    Action.create(email: @user_email, url: @url, type: @type, timestamp: action_time)
  end

  private

  def calculate_action_time
    expecting_like.delete
    time = Time.now
    adjusted_hours = time.hour + 24
    time.strftime('%d.%m.%Y ') + "#{adjusted_hours}:#{time.strftime('%M')}"
  end
end
