# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Homepage', type: :feature do
  let!(:images) { create_list(:image, 3) }

  before do
    visit root_path
  end

  scenario 'displays welcome title and description' do
    within('.container-welcome') do
      expect(page).to have_css('h1.title', text: I18n.t('home.welcome_title'))
      expect(page).to have_css('p.text', text: I18n.t('home.welcome_description'))
    end
  end

  scenario 'carousel navigation works' do
    within('.carousel-container') do
      expect(page).to have_button('Previous')
      expect(page).to have_button('Next')

      click_button 'Next'
      expect(find('.carousel-item.active')).to have_css("img[alt='Carousel image 2']")

      click_button 'Next'
      expect(find('.carousel-item.active')).to have_css("img[alt='Carousel image 3']")

      click_button 'Previous'
      expect(find('.carousel-item.active')).to have_css("img[alt='Carousel image 2']")
    end
  end
end
