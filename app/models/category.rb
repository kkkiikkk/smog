class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :images
  has_many :subscriptions
  validates :name, presence: true, uniqueness: true
end
