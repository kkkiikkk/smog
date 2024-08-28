# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.assets.compile = true
  config.assets.digest = true
  config.assets.precompile += %w[*.png *.jpg *.jpeg *.gif]
  config.active_storage.service = :local
  config.force_ssl = false
  config.logger = ActiveSupport::Logger.new($stdout)
                                       .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
                                       .then { |logger| ActiveSupport::TaggedLogging.new(logger) }
  config.log_tags = [:request_id]
  config.log_level = ENV.fetch('RAILS_LOG_LEVEL', 'info')
  config.hosts << 'smog.pp.ua'
  config.hosts << 'www.smog.pp.ua'
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store
  config.consider_all_requests_local = false
  config.action_dispatch.show_exceptions = :all
  config.active_support.report_deprecations = false
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default_url_options = { host: 'smog.pp.ua' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: '587',
    domain: Rails.application.credentials.smtp.domain,
    user_name: Rails.application.credentials.smtp.user_name,
    password: Rails.application.credentials.smtp.password,
    authentication: 'plain',
    enable_starttls_auto: true
  }
end
