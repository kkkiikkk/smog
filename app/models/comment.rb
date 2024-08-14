# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image

  validates :caption, presence: true

  def self.ransackable_associations(_auth_object = nil)
    %w[image user]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[caption created_at id id_value image_id updated_at user_id]
  end
end
