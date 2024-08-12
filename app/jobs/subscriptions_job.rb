class SubscriptionsJob < ApplicationJob
  queue_as :urgent

  def perform(*args)
    puts "HELLO"
  end
end
