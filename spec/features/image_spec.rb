# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Specefic image', type: :feature do
  let(:category) { create(:category) }
  let(:image) { create(:image, category:) }
  let(:user) { create(:user) }

  before do
    sign_in user
    visit category_image_path(category.slug, image)
  end

  scenario 'displays the image modal with correct content' do
    within('#imageModal') do
      expect(page).to have_css('.modal-dialog')
      expect(page).to have_css('.modal-content')

      within('.modal-body') do
        within('.like-section') do
          expect(page).to have_content("#{I18n.t('image_info.likes_title')}: #{image.likes.size}")
          expect(page).to have_button(class: 'btn btn-link')
        end

        within('.comments-container') do
          expect(page).to have_css('h5', text: I18n.t('image_info.comments_title'))

          within('.comment-form') do
            expect(page).to have_button(I18n.t('image_info.add_comment'))
          end
        end
      end
    end

    expect(page).to have_css('.modal-backdrop.fade.show')
  end
end
