FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    sequence(:email) { |n| "user#{n}@example.com" }
    username { 'helo_username' }
    password { 'password123' }
  end
end
