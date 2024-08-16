# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe ImagesController, type: :controller do

  describe 'GET #index' do
    login_user

    context 'successful response' do
      it 'returns all images' do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #show' do
    login_user

    let(:category_test) { create(:category) }
    let(:image_test) { create(:image, category: category_test) }

    context 'successful response' do
      it 'returns specific image when user signed in' do
        get :show, params: { category_id: category_test.id, id: image_test.id }
        expect(response.status).to eq(200)
      end
    end

    context 'not found response' do
      it 'returns 404 error when getting image when user signed in' do
        expect do
          get :show, params: { category_id: category_test.id, id: 21_921 }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'POST #create' do
    login_user
  
    let(:category_test) { create(:category) }

    context 'successful response' do
      it 'redirects to the created image' do
        post :create, params: { category_name: category_test.name,
                                image: {
                                  image: Rack::Test::UploadedFile.new('/home/developer/Documents/projects/ruby-tasts/smog/public/spaceTest.jpeg',
                                                                      'image/jpeg'),
                                  category_name: category_test.name
                                } }
        created_image = Image.last
        expect(response).to redirect_to(category_image_path(category_test, created_image))
      end
    end

    # context 'failed response, bad request' do
    #   it 'returns error' do 
    #     post :create, params: { category_name: 'wrong_category',
    #                             image: {
    #                               image: 'sdada',
    #                               category_name: 'wrong_category'
    #                             } }
    #     created_image = Image.last
    #     expect(response).to raise_error(ActionController::UrlGenerationError)
    #   end
    # end
  end
end
