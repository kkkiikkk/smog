# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET #index' do
    login_user

    context 'succesfull response' do
      it 'return categories' do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #show' do
    login_user

    context 'succesfull response' do
      let(:category_test) { create(:category) }

      it 'returns category' do
        get :show, params: { id: category_test.id }

        expect(response.status).to eq(200)
      end
    end

    context 'bad response' do 
      it 'returns not found expection' do
        expect do
          get :show, params: { id: 10010101010 }          
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
