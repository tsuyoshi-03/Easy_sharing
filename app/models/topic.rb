class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  
  belongs_to :user
  belongs_to :shop
  has_many :favorites
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
end
