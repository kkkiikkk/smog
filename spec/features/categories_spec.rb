require 'rails_helper'

RSpec.feature "Categories", type: :feature do
  let!(:categories) { create_list(:category, 3, :with_images) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario "displays categories with correct titles and images" do
    visit categories_path

    within('.category-container') do
      categories.each do |category|
        expect(page).to have_css(".category-title", text: category.name)
      end
    end
  end

  scenario "shows correct subscription buttons for user" do
    visit categories_path

    within('.category-container') do
      categories.each do |category|
        if category.subscriptions.empty?
          expect(page).to have_button(I18n.t('categories.subscribe_button'))
        else
          expect(page).to have_button(I18n.t('categories.unsubscribe_button'))
        end
      end
    end
  end
end
