FactoryBot.define do
  factory :user do
    id { 2 }
    email { 'hello@example.com' }
    username { 'helo_username' }
    password { 'password123' }
  end
end