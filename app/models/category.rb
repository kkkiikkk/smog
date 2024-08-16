# frozen_string_literal: true

class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :images
  has_many :subscriptions
  belongs_to :user
  validates :name, presence: true, uniqueness: true

  def self.ransackable_associations(_auth_object = nil)
    %w[images subscriptions]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value name slug updated_at user_id]
  end
end
