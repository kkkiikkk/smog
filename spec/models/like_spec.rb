# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'valid like' do
    FactoryBot.create(:user)
    let(:category_test) { create(:category, user: User.last) }
    let(:image_test) { create(:image, category: category_test) }

    subject(:like_test) { Like.new(image:, user:) }

    context 'when like is valid' do
      let(:image) { image_test }
      let(:user) { User.last }

      it 'returns true' do
        expect(like_test.valid?).to be(true)
      end
    end

    context 'when user for like is invalid' do
      let(:image) { image_test }
      let(:user) { nil }

      it 'returns false' do
        expect(like_test.valid?).to be(false)
      end
    end

    context 'when image for like is invalid' do
      let(:image) { nil }
      let(:user) { User.last }

      it 'returns false' do
        expect(like_test.valid?).to be(false)
      end
    end
  end
end
