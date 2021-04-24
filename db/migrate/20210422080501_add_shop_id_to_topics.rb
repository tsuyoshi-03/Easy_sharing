class AddShopIdToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :shop_id, :integer
  end
end
