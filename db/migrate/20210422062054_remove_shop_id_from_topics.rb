class RemoveShopIdFromTopics < ActiveRecord::Migration[5.2]
  def change
    remove_column :topics, :shop_id, :integer
  end
end
