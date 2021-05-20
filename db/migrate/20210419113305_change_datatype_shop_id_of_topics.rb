class ChangeDatatypeShopIdOfTopics < ActiveRecord::Migration[5.2]
  def up
  #  change_column :topics, :shop_id, :integer
  end
  
  def down
    change_column :topics, :shop_id, :string
  end
end
