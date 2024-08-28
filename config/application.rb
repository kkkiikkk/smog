# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Smog
  class Application < Rails::Application
    config.load_defaults 7.1
    config.exceptions_app = self.routes
    config.autoload_lib(ignore: %w[assets tasks])

    config.generators do |g|
      g.template_engine :slim
    end
    config.active_job.queue_adapter = :resque
    config.action_dispatch.cookies_same_site_protection = :none
    config.action_controller.default_protect_from_forgery = false
    config.i18n.default_locale = :en
    config.i18n.available_locales = %i[en ua]
    config.i18n.fallbacks = true
  end
end
