FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    sequence(:email) { |n| "user#{n}@example.com" }
    username { 'helo_username' }
    password { 'password123' }
    password_confirmation { "password123" }
    confirmed_at { Time.now }
  end
end
