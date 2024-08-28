# frozen_string_literal: true

require 'capybara/rspec'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :selenium_headless do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome,
                                      options: Selenium::WebDriver::Chrome::Options.new(args: %w[headless disable-gpu]))
end

Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium

Capybara.javascript_driver = :selenium_headless
