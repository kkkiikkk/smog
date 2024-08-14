class Action < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["action_type", "created_at", "email", "id", "id_value", "timestamp", "updated_at", "url"]
  end
end
