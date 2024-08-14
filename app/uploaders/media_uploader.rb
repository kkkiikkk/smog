# frozen_string_literal: true

class MediaUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def content_type_allowlist
    [%r{image/}]
  end

  version :thumbnail do
    process resize_to_fit: [50, 50]
  end

  version :thumb do
    process resize_to_fit: [450, 450]
  end

  def extension_allowlist
    %w[jpg jpeg png]
  end
end
