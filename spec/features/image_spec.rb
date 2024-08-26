require 'rails_helper'

RSpec.feature "Specefic image", type: :feature do
  let(:category) { create(:category) }
  let(:image) { create(:image, category: category) }
  let(:user) { create(:user) }

  before do
    sign_in user
    visit category_image_path(category.slug, image)
    click_on 'Open Image Modal'
  end

  scenario "displays the image modal with correct content" do
    within('#imageModal') do
      expect(page).to have_css('.modal-dialog')
      expect(page).to have_css('.modal-content')
      
      within('.modal-header') do
        expect(page).to have_css('h5', text: I18n.t('image_info.comments_title'))
      end

      within('.modal-body') do
        expect(page).to have_css('.modal-content-wrapper')
        
        within('.image-container') do
          expect(page).to have_css('img#modalImage.fixed-dimensions[src*="' + image.image.url(:thumb) + '"]')
        end

        within('.like-section') do
          expect(page).to have_content("#{I18n.t('image_info.likes_title')}: #{image.likes.size}")
          expect(page).to have_button(class: 'btn btn-link')
        end

        within('.comments-container') do
          expect(page).to have_css('h5', text: I18n.t('image_info.comments_title'))

          within('.comment-form') do
            expect(page).to have_css('form#commentForm')
            expect(page).to have_css('.form-group', count: 3)
            expect(page).to have_css('textarea.form-control')
            expect(page).to have_button(I18n.t('image_info.add_comment'))
          end

          within('.comments-list') do
            image.comments.each do |comment|
              expect(page).to have_content(comment.caption)
            end
          end
        end
      end

      within('.modal-footer') do
        expect(page).to have_link(I18n.t('image_info.close_image'), href: category_path(category.slug))
      end
    end

    expect(page).to have_css('.modal-backdrop.fade.show')
  end
end
