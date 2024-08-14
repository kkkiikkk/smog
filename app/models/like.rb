class Like < ApplicationRecord
  belongs_to :user
  belongs_to :image

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "image_id", "updated_at", "user_id"]
  end
end
