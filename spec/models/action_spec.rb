# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Action, type: :model do
  describe 'valid action' do
    subject(:action_test) { Action.new(action_type:, email: 'test', url: 'test') }

    context 'when action is valid' do
      let(:action_type) { 'test_action' }

      it 'returns true' do
        expect(action_test.valid?).to be(true)
      end
    end

    context 'when action type is invalid' do
      let(:action_type) { nil }

      it 'returns false' do
        expect(action_test.valid?).to be(false)
      end
    end
  end
end
