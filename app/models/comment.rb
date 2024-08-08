class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image

  validates :caption, presence: true
end
