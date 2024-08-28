# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Category Images', type: :feature do
  let(:category) { create(:category) }
  let!(:images) { create_list(:image, 15, category:) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario 'displays category name and image list with pagination' do
    visit category_path(category.slug)

    within('.content-wrapper') do
      expect(page).to have_css('h1', text: category.name)
    end

    within('.pagination-footer') do
      expect(page).to have_css('.pagination')
      click_link '2'
    end

    within('.content-wrapper') do
      images.last(5).each do |image|
        expect(page).to have_css("img[src*='#{File.basename(image.image.url)}']")
      end
    end
  end
end
