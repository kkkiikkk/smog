class Image < ApplicationRecord
  mount_uploader :image, MediaUploader
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :category

  validates_processing_of :image
  validates :image, presence: true
  validate :image_size_validation

  private

  def image_size_validation
    errors[:iamge] << 'should be less than 500kb' if image.size > 0.5.megabytes
  end
end
