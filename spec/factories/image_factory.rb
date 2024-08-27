FactoryBot.define do
  factory :image do
    association :category
    image { Rack::Test::UploadedFile.new(Rails.root.join('public/spaceTest.jpeg'), 'image/jpeg') }
  end
end