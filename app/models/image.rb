class Image < ApplicationRecord
  mount_uploader :image, MediaUploader
  mount_uploader :image, MediaUploader


  validates_processing_of :image
  validate :image_size_validation

  private

  def image_size_validation
    errors[:iamge] << 'should be less than 500kb' if image.size > 0.5.megabytes
  end
end
