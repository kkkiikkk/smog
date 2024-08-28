# frozen_string_literal: true

namespace :app do
  desc 'TODO'
  task :migrate_images, [:path] => [:environment] do |_, _args|
    path = Rails.root.join('db', 'seed_categories')
    image_parser = ImageParser.new(path)
    image_parser.parse
  end
end
