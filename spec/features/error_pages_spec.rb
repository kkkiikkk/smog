# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Error Pages', type: :feature do
  scenario 'displays 404 error page' do
    visit '/non-existent-page'

    expect(page).to have_content('404')
    expect(page).to have_content('The page you are looking for could not be found.')
  end
end
