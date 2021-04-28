class AddShopRefToTopics < ActiveRecord::Migration[5.2]
  def change
    add_reference :topics, :shop, foreign_key: true
  end
end
