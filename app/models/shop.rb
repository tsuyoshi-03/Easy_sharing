class Shop < ApplicationRecord
  has_many :topics
  
  #geocoded_by :address
  #after_validation :geocode
end
