class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
end
