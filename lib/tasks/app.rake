# frozen_string_literal: true

ARGUMENT_ERROR = "Path should be provided as an argument. Example:\n rake app:migrate_images[/home/developer/Documents/projects/image_for_parse]"

namespace :app do
  desc 'TODO'
  task :migrate_images, [:path] => [:environment] do |_, args|
    raise ArgumentError, ARGUMENT_ERROR if args[:path].nil?
  
    image_parser = ImageParser.new(args[:path])
    image_parser.parse
  end
end
