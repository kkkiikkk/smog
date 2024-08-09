class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :images
  validates :name, presence: true, uniqueness: true
end
