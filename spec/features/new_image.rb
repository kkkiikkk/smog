# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/capybara'

RSpec.feature 'Image Upload', type: :feature do
  let(:category) { create(:category, name: 'Test2 Category') }
  let(:user) { create(:user) }
  let!(:image) { build(:image, category:) }

  before do
    sign_in user
    visit new_image_path
  end

  scenario 'displays the image upload form and allows image upload' do
    within('.container.text-center') do
      within('.row.justify-content-center') do
        expect(page).to have_css('form')

        within('form') do
          expect(page).to have_css('label', text: I18n.t('app_pin_page.category_input_label'))
          expect(page).to have_field('image[category_name]', class: 'form-control')

          expect(page).to have_css('.image-preview.hidden', visible: false)
          expect(page).to have_css('.form-group.upload-container')
          expect(page).to have_css('input#file-upload[type="file"][name="image[image]"]')

          within('label[for="file-upload"]') do
            expect(page).to have_css('span.icon i.fas.fa-arrow-up')
            expect(page).to have_css('span.text', text: I18n.t('app_pin_page.category_recommend_text'))
          end

          expect(page).to have_css('.upload-info', text: I18n.t('app_pin_page.image_upload_info'))

          expect(page).to have_button(I18n.t('app_pin_page.submit_image'), disabled: true)
        end
      end
    end
  end

  scenario 'enables submit button after file upload and form submission' do
    within('.container.text-center') do
      within('.row.justify-content-center') do
        attach_file('image[image]', Rails.root.join('public/spaceTest.jpeg'), make_visible: true)

        expect(page).to have_button(I18n.t('app_pin_page.submit_image'), disabled: false) # Ensure the button is enabled

        fill_in 'image[category_name]', with: 'Test Category'

        click_button I18n.t('app_pin_page.submit_image')

        expect(page).to have_current_path(image_path(Image.last))
        expect(page).to have_content('Image was successfully created.')
      end
    end
  end
end
