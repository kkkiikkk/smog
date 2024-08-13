class SubscriptionsJob < ApplicationJob
  queue_as :default

  def perform(image, category)
    subscriptions = Subscription.joins(:user).where(category_id: category.id).distinct
    subscriptions.each do |subscription|
      SubscriptionMailer.added_new_image(subscription.user, image).deliver_now
    end
  end
end
