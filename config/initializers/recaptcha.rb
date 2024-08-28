# frozen_string_literal: true

Recaptcha.configure do |config|
  config.site_key = Rails.application.credentials.recaptcha.site_key_v2
  config.secret_key = Rails.application.credentials.recaptcha.secret_key_v2
end
