require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'image valid' do 
    FactoryBot.create(:user)
    let(:category_test) { create(:category, user: User.last) }
    subject(:image_test) { Image.new(category: category, image: image ) }

    context 'when image is valid' do 
      let(:category) { category_test }
      let(:image) { Rack::Test::UploadedFile.new('/Users/rostislavrudnovskij/Documents/Jobs/smog/public/spaceTest.jpeg', 'image/jpeg') }
      
      it 'returns true' do 
        expect(image_test.valid?).to be(true)
      end
    end

    context 'when image path is invalid' do 
      let(:category) { category_test }
      let(:image) { nil }
      
      it 'returns false' do 
        expect(image_test.valid?).to be(false)
      end
    end

    context 'when image category is invalid' do 
      let(:category) { nil }
      let(:image) { Rack::Test::UploadedFile.new('/Users/rostislavrudnovskij/Documents/Jobs/smog/public/spaceTest.jpeg', 'image/jpeg') }
      
      it 'returns false' do 
        expect(image_test.valid?).to be(false)
      end
    end
  end
end