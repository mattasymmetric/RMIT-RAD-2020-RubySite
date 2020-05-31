class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 1024}
  validates :views, presence: true, numericality: {greater_than_or_equal_to: 0} 
end
