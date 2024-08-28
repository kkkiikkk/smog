# frozen_string_literal: true

FriendlyId.defaults do |config|
  config.use :reserved
  config.use :finders
  config.use :slugged

  config.reserved_words = %w[new edit index session login logout users admin
                             stylesheets assets javascripts images]
end
