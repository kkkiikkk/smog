FactoryBot.define do
  factory :user do
    sequence(:id) { |n| rand(1..1000)  }
    sequence(:email) { |n| "user#{rand(1..1000)}@example.com" }
    username { 'helo_username' }
    password { 'password123' }
    password_confirmation { "password123" }
    confirmed_at { Time.now }
  end
end
