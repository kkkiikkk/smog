# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :image

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value image_id updated_at user_id]
  end
end
