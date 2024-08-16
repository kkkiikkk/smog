# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe LikesController, type: :controller do
  describe 'POST #create' do
    login_user

    context 'succesfull response' do
      let(:category_test) { create(:category) }
      let(:image_test) { create(:image, category: category_test) }
      it 'returns updated image with new like' do
        post :create, params: { category_id: category_test.id, image_id: image_test.id }

        image = Image.includes(:likes).find_by(id: image_test.id)
        expect(image.likes.size).to eq(1)
      end
    end

    context 'bad response' do
      let(:category_test) { create(:category) }
      it 'returns error' do
        expect do
          post :create, params: { category_id: category_test.id, image_id: 2_222_222 }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
