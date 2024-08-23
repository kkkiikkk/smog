# frozen_string_literal: true

ARGUMENT_ERROR = "Path should be provided as an argument. Example:\n rake app:migrate_images[/home/developer/Documents/projects/image_for_parse]"

namespace :app do
  desc 'TODO'
  task :migrate_images, [:path] => [:environment] do |_, args|
    path = Rails.root.join('db', 'seed_categories')
    image_parser = ImageParser.new(path)
    image_parser.parse
  end
end
