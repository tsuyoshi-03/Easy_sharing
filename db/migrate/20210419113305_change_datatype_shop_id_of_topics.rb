class ChangeDatatypeShopIdOfTopics < ActiveRecord::Migration[5.2]
  def change
    change_column :topics, :shop_id, :integer
  end
end
