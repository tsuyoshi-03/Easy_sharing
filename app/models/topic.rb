class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  
  belongs_to :user
  belongs_to :shop
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader
end
