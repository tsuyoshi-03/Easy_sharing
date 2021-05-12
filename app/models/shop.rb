class Shop < ApplicationRecord
  has_many :topics
  
  geocoded_by :address
  after_validation :geocode
  
  scope :by_name_like, lambda { |name|
    where('name LIKE :value', { value: "%#{sanitize_sql_like(name)}%"})
  }
end
