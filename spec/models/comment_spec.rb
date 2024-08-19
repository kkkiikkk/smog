require 'rails_helper'

RSpec.describe Comment, type: :model do  
  describe 'valid comment' do 
    FactoryBot.create(:user)
    let(:category_test) { create(:category, user: User.last) }
    let(:image_test) { create(:image, category: category_test) }
  
    subject(:comment_test) { Comment.new(caption: caption, image: image, user: user) }
    
    context 'when caption is valid' do
      let(:caption) { 'New comment' }
      let(:image) { image_test }
      let (:user) { User.last }

      it 'returns true' do 
        expect(comment_test.valid?).to be(true)
      end
    end

    context 'when caption is invalid' do
      let(:caption) { '' }
      let(:image) { image_test }
      let (:user) { User.last }

      it 'returns false' do
        expect(comment_test.valid?).to be(false)
      end
    end

    context 'when image is nil' do
      let(:caption) { 'New comment' }
      let(:image) { nil }
      let (:user) { User.last }

      it 'returns false' do
        expect(comment_test.valid?).to be(false)
      end
    end

    context 'when user is nil' do
      let(:caption) { 'New comment' }
      let(:image) { image_test }
      let (:user) { nil }

      it 'returns false' do
        expect(comment_test.valid?).to be(false)
      end
    end
  end
end