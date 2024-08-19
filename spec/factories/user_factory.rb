FactoryBot.define do
  factory :user do
    sequence(:id) { |n| rand(10000..100000000)  }
    sequence(:email) { |n| "user#{rand(10000..100000000)}@example.com" }
    username { 'helo_username' }
    password { 'password123' }
    password_confirmation { "password123" }
    confirmed_at { Time.now }
  end
end
