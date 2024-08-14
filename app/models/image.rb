# frozen_string_literal: true

class Image < ApplicationRecord
  mount_uploader :image, MediaUploader
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :category

  validates_processing_of :image
  validates :image, presence: true
  validate :image_size_validation

  def self.ransackable_associations(_auth_object = nil)
    %w[category comments likes]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[category_id created_at id id_value image updated_at]
  end

  private

  def image_size_validation
    errors[:iamge] << 'should be less than 500kb' if image.size > 0.5.megabytes
  end
end
