class SubscriptionMailer < ApplicationMailer
  default from: 'ruddnovskiy@gmail.com'

  def added_new_image(user, image)
    @user = user
    @image = image
    @subscriptions = user.subscriptions

    mail(to: @user.email, subject: 'Your Daily Subscription Update')
  end
end
