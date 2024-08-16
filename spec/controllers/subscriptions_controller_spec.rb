# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe SubscriptionsController, type: :controller do
  describe 'POST #create' do
    login_user

    context 'succesfull response' do
      let(:category_test) { create(:category) }
      it 'returns new subscription' do
        post :create, params: { category_id: category_test.id }

        subscription = Subscription.last

        expect(subscription.category_id).to eq(category_test.id)
      end
    end
  end
end
