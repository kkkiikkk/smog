FactoryBot.define do
  factory :image do
    image { Rack::Test::UploadedFile.new('/home/developer/Documents/projects/ruby-tasts/smog/public/spaceTest.jpeg', 'image/jpeg') }
    category
  end
end