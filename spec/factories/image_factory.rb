FactoryBot.define do
  factory :image do
    image { Rack::Test::UploadedFile.new('/Users/rostislavrudnovskij/Documents/Jobs/smog/public/spaceTest.jpeg', 'image/jpeg') }
    category
  end
end