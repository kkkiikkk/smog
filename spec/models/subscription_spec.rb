# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'valid subscription' do
    FactoryBot.create(:user)
    let(:category_test) { create(:category, user: User.last) }

    subject(:subscription_test) { Subscription.new(category:, user:) }

    context 'when subscription is valid' do
      let(:category) { category_test }
      let(:user) { User.last }

      it 'returns true' do
        expect(subscription_test.valid?).to be(true)
      end
    end

    context 'when subscription category is invalid' do
      let(:category) { nil }
      let(:user) { User.last }

      it 'returns false' do
        expect(subscription_test.valid?).to be(false)
      end
    end

    context 'when subscription user is invalid' do
      let(:category) { category_test }
      let(:user) { nil }

      it 'returns false' do
        expect(subscription_test.valid?).to be(false)
      end
    end
  end
end
