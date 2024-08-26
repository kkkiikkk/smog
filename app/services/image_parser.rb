# frozen_string_literal: true

class ImageParser
  def initialize(path)
    @path = path
  end

  def parse
    categories = get_categories
    if categories.empty?
      raise LoadError,
            "In provided path categories does not exist\n Category should located like that:\n /Category1\n\tImage1.jpg\n\tImage2.jpg"
    end

    categories.each do |category|
      images = get_images_by_category(category)
      if images.empty?
        raise LoadError,
              "You have no image\n Image should located like that:\n /Category1\n\tImage1.jpg\n\tImage2.jpg"
      end
      images.each do |image_path|
        create_image(category, image_path)
      end
    end
  end

  private

  def get_categories
    Dir.entries(@path).select { |entry| File.directory?(File.join(@path, entry)) && !['.', '..'].include?(entry) }
  end

  def get_images_by_category(category)
    category_path = File.join(@path, category)
    Dir.glob("#{category_path}/*.{jpg,jpeg,png}")
  end

  def create_image(category_name, image_path)
    category = Category.find_or_create_by(name: category_name)
    image = Image.new
    image.category = category
    image.image = File.open(image_path)

    if image.save
      puts "Saved image: #{image_path} under category: #{category_name}"
    else
      puts "Failed to save image: #{image_path} - #{image.errors.full_messages.join(', ')}"
    end
  end
end
