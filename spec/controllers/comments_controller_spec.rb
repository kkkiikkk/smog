# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    login_user

    context 'succesfull response' do
      let(:category_test) { create(:category) }
      let(:image_test) { create(:image, category: category_test) }
      it 'returns new comment' do
        post :create, params: { category_id: category_test.id, image_id: image_test.id, comment: { caption: "NEW CAPTION" } }

        comment = Comment.last
        expect(comment.caption).to eq('NEW CAPTION')
      end
    end

    context 'bad response' do
      let(:category_test) { create(:category) }
      let(:image_test) { create(:image, category: category_test) }
      it 'returns new comment' do
        expect do 
          post :create, params: { category_id: category_test.id, image_id: image_test.id}
        end.to raise_error(ActionController::ParameterMissing)
      end
    end
  end
end
