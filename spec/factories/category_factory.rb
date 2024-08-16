FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "CategoryTest#{n}" }
    user
  end
end
