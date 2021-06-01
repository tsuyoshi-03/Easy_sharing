class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  
  has_secure_password
  
  has_many :topics, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
end
