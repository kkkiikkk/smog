# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "CategoryTest#{n}" }
    user
    trait :with_images do
      after(:create) do |category|
        create_list(:image, 3, category:)
      end
    end
  end
end
