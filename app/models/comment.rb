class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :comment_content, presence: true
  
  belongs_to :user
  belongs_to :topic
end
