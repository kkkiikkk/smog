require 'rails_helper'

RSpec.describe Category, type: :model do 
  describe 'valid category' do
    FactoryBot.create(:user)
    
    subject(:category_test) { Category.new(user: user, name: name) }

    context 'when category is valid' do 
      let(:user) { User.last }
      let(:name) { 'New category' }

      it 'returns true' do 
        expect(category_test.valid?).to be(true)
      end
    end

    context 'when category name is invalid' do 
      let(:user) { User.last }
      let(:name) { nil }

      it 'returns false' do 
        expect(category_test.valid?).to be(false)
      end
    end

    context 'when category user is invalid' do 
      let(:user) { nil }
      let(:name) { 'New category 1' }

      it 'returns false' do 
        expect(category_test.valid?).to be(false)
      end
    end
  end
end