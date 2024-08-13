namespace :start_job do
  desc 'Enqueue subscription job'
  task enqueue_subscriptions_job: :environment do
    SubscriptionsJob.perform_later
  end
end
