# frozen_string_literal: true

class Action < ApplicationRecord
  validates :action_type, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[action_type created_at email id id_value timestamp updated_at url]
  end
end
