# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'image valid' do
    FactoryBot.create(:user)
    let(:category_test) { create(:category, user: User.last) }
    subject(:image_test) { Image.new(category:, image:) }

    context 'when image is valid' do
      let(:category) { category_test }
      let(:image) do
        Rack::Test::UploadedFile.new('/home/developer/Documents/projects/ruby-tasts/smog/public/spaceTest.jpeg',
                                     'image/jpeg')
      end

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
      let(:image) do
        Rack::Test::UploadedFile.new('/home/developer/Documents/projects/ruby-tasts/smog/public/spaceTest.jpeg',
                                     'image/jpeg')
      end

      it 'returns false' do
        expect(image_test.valid?).to be(false)
      end
    end
  end
end
