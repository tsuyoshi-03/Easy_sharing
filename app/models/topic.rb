class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  
  belongs_to :user
  belongs_to :shop
  has_many :favorites
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  
  scope :by_shop_name_like, lambda { |shop_name|
    where('shop_name LIKE :value', { value: "#{sanitize_sql_like(shop_name)}%"})
  }
end
